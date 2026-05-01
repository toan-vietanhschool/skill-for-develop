# Kubernetes Operations

## Purpose

Provide patterns and runbooks for deploying, managing, and troubleshooting applications on Kubernetes — from initial setup to production operations.

## When to Use

- Deploying applications to Kubernetes clusters
- Setting up new environments (dev/staging/production)
- Troubleshooting pod failures, networking, or scaling issues
- Implementing CI/CD pipelines for K8s deployments
- Planning capacity and cost optimization

## Core Concepts

| Concept | Purpose |
|---------|---------|
| **Pod** | Smallest deployable unit (one or more containers) |
| **Deployment** | Manages pod replicas and rolling updates |
| **Service** | Stable network endpoint for pods |
| **Ingress** | External HTTP/HTTPS routing |
| **ConfigMap** | Non-sensitive configuration |
| **Secret** | Sensitive configuration (encrypted) |
| **Namespace** | Logical isolation within a cluster |
| **HPA** | Horizontal Pod Autoscaler |
| **PVC** | Persistent Volume Claim (storage) |

## Project Structure

```
k8s/
├── base/                    # Shared manifests
│   ├── deployment.yaml
│   ├── service.yaml
│   ├── ingress.yaml
│   ├── configmap.yaml
│   └── hpa.yaml
├── overlays/                # Environment-specific patches
│   ├── dev/
│   │   ├── kustomization.yaml
│   │   ├── replicas-patch.yaml
│   │   └── env-config.yaml
│   ├── staging/
│   └── production/
│       ├── kustomization.yaml
│       ├── replicas-patch.yaml
│       ├── resources-patch.yaml
│       └── env-config.yaml
└── scripts/
    ├── deploy.sh
    └── rollback.sh
```

## Deployment Manifest Template

```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: app-name
  labels:
    app: app-name
    version: v1
spec:
  replicas: 3
  selector:
    matchLabels:
      app: app-name
  strategy:
    type: RollingUpdate
    rollingUpdate:
      maxSurge: 1
      maxUnavailable: 0
  template:
    metadata:
      labels:
        app: app-name
        version: v1
    spec:
      containers:
      - name: app-name
        image: registry/app-name:tag
        ports:
        - containerPort: 3000
        resources:
          requests:
            cpu: 100m
            memory: 128Mi
          limits:
            cpu: 500m
            memory: 512Mi
        livenessProbe:
          httpGet:
            path: /health
            port: 3000
          initialDelaySeconds: 15
          periodSeconds: 10
        readinessProbe:
          httpGet:
            path: /ready
            port: 3000
          initialDelaySeconds: 5
          periodSeconds: 5
        env:
        - name: NODE_ENV
          value: production
        - name: DATABASE_URL
          valueFrom:
            secretKeyRef:
              name: app-secrets
              key: database-url
```

## Health Checks

| Probe | Purpose | Failure Action |
|-------|---------|---------------|
| **Liveness** | Is the container alive? | Restart container |
| **Readiness** | Can it serve traffic? | Remove from service |
| **Startup** | Has it started? | Block liveness/readiness until ready |

## Deployment Strategies

| Strategy | Risk | Downtime | Rollback Speed |
|----------|------|----------|---------------|
| **Rolling Update** | Low | Zero | Fast (kubectl rollout undo) |
| **Blue-Green** | Low | Zero | Instant (switch service) |
| **Canary** | Lowest | Zero | Fast (scale down canary) |
| **Recreate** | High | Yes | Slow |

## Troubleshooting Runbook

### Pod Not Starting

```bash
# 1. Check pod status
kubectl get pods -n namespace
kubectl describe pod pod-name -n namespace

# 2. Check logs
kubectl logs pod-name -n namespace
kubectl logs pod-name -n namespace --previous  # crashed container

# 3. Common issues
# - ImagePullBackOff → wrong image name/tag, registry auth
# - CrashLoopBackOff → app crashes on startup, check logs
# - Pending → insufficient resources, check node capacity
# - OOMKilled → increase memory limits
```

### Service Not Reachable

```bash
# 1. Verify service exists and has endpoints
kubectl get svc -n namespace
kubectl get endpoints svc-name -n namespace

# 2. Check if pods match service selector
kubectl get pods -l app=app-name -n namespace

# 3. Test from within cluster
kubectl run debug --rm -it --image=curlimages/curl -- sh
curl http://svc-name.namespace.svc.cluster.local:port

# 4. Check ingress
kubectl get ingress -n namespace
kubectl describe ingress ingress-name -n namespace
```

### High Resource Usage

```bash
# Check node resources
kubectl top nodes
kubectl top pods -n namespace --sort-by=memory

# Check HPA status
kubectl get hpa -n namespace

# Check resource quotas
kubectl describe resourcequota -n namespace
```

## Scaling

### Horizontal Pod Autoscaler

```yaml
apiVersion: autoscaling/v2
kind: HorizontalPodAutoscaler
metadata:
  name: app-name-hpa
spec:
  scaleTargetRef:
    apiVersion: apps/v1
    kind: Deployment
    name: app-name
  minReplicas: 2
  maxReplicas: 10
  metrics:
  - type: Resource
    resource:
      name: cpu
      target:
        type: Utilization
        averageUtilization: 70
  - type: Resource
    resource:
      name: memory
      target:
        type: Utilization
        averageUtilization: 80
```

## Security Checklist

- [ ] No containers running as root
- [ ] Resource limits set on all containers
- [ ] Network policies restrict pod-to-pod communication
- [ ] Secrets encrypted at rest (not in plain YAML)
- [ ] RBAC configured with least privilege
- [ ] Pod Security Standards enforced
- [ ] Image scanning in CI pipeline
- [ ] No `latest` tag in production

## Rules

- **Never** deploy to production without resource limits
- **Never** store secrets in ConfigMaps or plain YAML
- **Never** use `latest` tag — always pin image versions
- **Always** set both liveness and readiness probes
- **Always** use namespaces for environment isolation
- **Always** set `maxUnavailable: 0` for zero-downtime deploys
- **Always** test rollback procedure before going live
