# Infrastructure as Code (IaC)

## Purpose

Define, provision, and manage infrastructure through code rather than manual processes. Ensure environments are reproducible, version-controlled, and auditable.

## When to Use

- Setting up new environments (dev, staging, production)
- Provisioning cloud resources (compute, storage, networking, databases)
- Managing DNS, CDN, load balancers
- Configuring CI/CD infrastructure
- Disaster recovery setup

## Core Principles

1. **Everything in code** — no manual console clicks for production
2. **Idempotent** — running the same code twice produces the same result
3. **Version controlled** — all infra changes go through PR review
4. **Immutable infrastructure** — replace, don't patch
5. **Least privilege** — minimal permissions for each resource

## Tool Selection

| Tool | Best For | State Management |
|------|----------|-----------------|
| **Terraform** | Multi-cloud, general-purpose | Remote state (S3, GCS, Azure Blob) |
| **Pulumi** | Developers who prefer real code (TS/Python/Go) | Pulumi Cloud or self-managed |
| **AWS CDK** | AWS-only shops | CloudFormation |
| **Ansible** | Configuration management, server setup | Stateless |

## Project Structure (Terraform)

```
infrastructure/
├── environments/
│   ├── dev/
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   └── terraform.tfvars
│   ├── staging/
│   └── production/
├── modules/
│   ├── networking/
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   └── outputs.tf
│   ├── compute/
│   ├── database/
│   ├── monitoring/
│   └── security/
├── global/
│   ├── iam/
│   ├── dns/
│   └── state-backend/
└── scripts/
    ├── plan.sh
    └── apply.sh
```

## Workflow

### 1. Plan Before Apply

```bash
# Always preview changes before applying
terraform plan -out=tfplan
# Review the plan output carefully
terraform apply tfplan
```

### 2. Environment Promotion

```
dev → staging → production
```

- Same modules, different variable values
- Staging must mirror production config (smaller scale)
- Never test infra changes directly in production

### 3. State Management

- **Remote state** — never local for team projects
- **State locking** — prevent concurrent modifications
- **State encryption** — encrypt at rest
- **Never manually edit state** — use `terraform state mv/rm` commands

### 4. Secret Management

- Use cloud-native secret managers (AWS Secrets Manager, GCP Secret Manager, Azure Key Vault)
- Reference secrets by ARN/ID, never store values in tfvars
- Rotate secrets automatically where possible

## Module Design

- One responsibility per module
- Clear input variables with descriptions and validation
- Meaningful outputs for cross-module references
- Pin provider versions
- Tag all resources (environment, team, cost-center, managed-by)

## Safety Checklist

Before applying to production:

- [ ] Plan reviewed by at least one other engineer
- [ ] No `destroy` actions on critical resources
- [ ] Backup/snapshot taken if modifying databases
- [ ] Rollback plan documented
- [ ] Apply during low-traffic window
- [ ] Monitoring dashboards open during apply

## Anti-Patterns

- ClickOps (manual console changes) for anything beyond initial exploration
- Hardcoded values instead of variables
- Monolithic configs instead of modules
- No remote state or state locking
- Applying without planning first
- Sharing cloud credentials instead of using IAM roles
