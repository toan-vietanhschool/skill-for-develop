# Load Testing

## Purpose

Validate system performance under expected and peak traffic conditions. Identify bottlenecks, breaking points, and capacity limits before users find them.

## When to Use

- Before launching a new product or feature
- After significant architecture changes
- Before expected traffic spikes (marketing campaigns, seasonal events)
- When setting SLA/SLO performance targets
- When capacity planning for scaling decisions
- After performance-related incidents

## Types of Performance Tests

| Type | Goal | Duration | Load Pattern |
|------|------|----------|-------------|
| **Smoke Test** | Verify system works under minimal load | 1-2 min | 1-5 users |
| **Load Test** | Validate under expected traffic | 15-30 min | Ramp to expected users |
| **Stress Test** | Find the breaking point | 15-30 min | Ramp beyond capacity |
| **Spike Test** | Handle sudden traffic bursts | 5-10 min | Sudden jump and drop |
| **Soak Test** | Find memory leaks, degradation | 2-8 hours | Sustained normal load |
| **Capacity Test** | Determine max throughput | 30-60 min | Gradual increase until failure |

## Performance Targets

| Metric | Target | Critical Threshold |
|--------|--------|--------------------|
| **Response Time (p50)** | < 200ms | < 500ms |
| **Response Time (p95)** | < 500ms | < 1s |
| **Response Time (p99)** | < 1s | < 2s |
| **Error Rate** | < 0.1% | < 1% |
| **Throughput** | Meets expected RPS | > 80% of target |
| **CPU Usage** | < 70% at normal load | < 85% at peak |
| **Memory Usage** | < 70% at normal load | < 85% at peak |

## Tool Selection

| Tool | Language | Best For |
|------|----------|---------|
| **k6** | JavaScript | Developer-friendly, CI integration |
| **Artillery** | YAML/JS | Quick setup, serverless support |
| **Locust** | Python | Custom scenarios, distributed |
| **JMeter** | Java/GUI | Complex protocols, legacy systems |
| **Gatling** | Scala | High-performance, detailed reports |
| **wrk/wrk2** | CLI | Simple HTTP benchmarks |

## k6 Test Template

```javascript
import http from 'k6/http';
import { check, sleep } from 'k6';
import { Rate, Trend } from 'k6/metrics';

const errorRate = new Rate('errors');
const responseTime = new Trend('response_time');

export const options = {
  stages: [
    { duration: '2m', target: 50 },   // ramp up
    { duration: '5m', target: 50 },   // steady state
    { duration: '2m', target: 100 },  // push to peak
    { duration: '5m', target: 100 },  // steady at peak
    { duration: '2m', target: 0 },    // ramp down
  ],
  thresholds: {
    http_req_duration: ['p(95)<500', 'p(99)<1000'],
    errors: ['rate<0.01'],
    http_req_failed: ['rate<0.01'],
  },
};

export default function () {
  // Scenario: User browses and performs actions
  const baseUrl = __ENV.BASE_URL || 'http://localhost:3000';

  // GET - List endpoint
  const listRes = http.get(`${baseUrl}/api/items`);
  check(listRes, {
    'list status 200': (r) => r.status === 200,
    'list response time < 500ms': (r) => r.timings.duration < 500,
  });
  errorRate.add(listRes.status !== 200);
  responseTime.add(listRes.timings.duration);

  sleep(1);

  // POST - Create endpoint
  const payload = JSON.stringify({ name: `item-${Date.now()}` });
  const createRes = http.post(`${baseUrl}/api/items`, payload, {
    headers: { 'Content-Type': 'application/json' },
  });
  check(createRes, {
    'create status 201': (r) => r.status === 201,
  });
  errorRate.add(createRes.status !== 201);

  sleep(1);
}
```

## Test Execution Workflow

### 1. Prepare

- [ ] Test environment mirrors production (or is well-understood)
- [ ] Test data seeded (realistic volume)
- [ ] Monitoring dashboards ready (CPU, memory, DB connections, error rates)
- [ ] Baseline metrics captured (no-load performance)
- [ ] Team notified (load tests can impact shared environments)

### 2. Execute

```bash
# Smoke test first
k6 run --vus 5 --duration 1m script.js

# Then full load test
k6 run script.js

# With environment variable
k6 run -e BASE_URL=https://staging.example.com script.js
```

### 3. Analyze

Look for:
- Response time degradation as load increases
- Error rate spikes at specific concurrency levels
- Resource saturation (CPU, memory, DB connections, disk I/O)
- Queueing effects (response times increasing linearly)
- Memory leaks (gradual increase over time in soak tests)

### 4. Report

```markdown
# Load Test Report — YYYY-MM-DD

## Test Configuration
- Target: [URL]
- Duration: [X minutes]
- Peak concurrent users: [N]
- Test type: [Load/Stress/Spike/Soak]

## Results Summary
| Metric | Result | Target | Status |
|--------|--------|--------|--------|
| p50 response time | Xms | <200ms | PASS/FAIL |
| p95 response time | Xms | <500ms | PASS/FAIL |
| p99 response time | Xms | <1000ms | PASS/FAIL |
| Error rate | X% | <0.1% | PASS/FAIL |
| Max throughput | X RPS | Y RPS | PASS/FAIL |
| Max concurrent users | X | Y | PASS/FAIL |

## Bottlenecks Identified
1. [bottleneck description and evidence]

## Recommendations
1. [specific fix with expected improvement]

## Comparison with Previous Run
| Metric | Previous | Current | Change |
|--------|----------|---------|--------|
| p95 | Xms | Yms | ↑↓ Z% |
```

## Common Bottlenecks

| Symptom | Likely Cause | Fix |
|---------|-------------|-----|
| Response time increases linearly | Database queries, missing indexes | Add indexes, optimize queries |
| Sudden error spike at N users | Connection pool exhausted | Increase pool size, add connection pooling |
| Memory grows over time | Memory leak | Profile and fix leaks |
| CPU spikes on specific endpoints | Expensive computation | Cache, optimize, or offload to background |
| Timeouts under load | Slow external dependencies | Add timeouts, circuit breakers, caching |

## CI Integration

Run load tests automatically on staging after deploy:

```yaml
# GitHub Actions example
load-test:
  runs-on: ubuntu-latest
  needs: deploy-staging
  steps:
    - uses: actions/checkout@v4
    - uses: grafana/k6-action@v0.3.1
      with:
        filename: tests/load/script.js
      env:
        BASE_URL: ${{ vars.STAGING_URL }}
```

## Rules

- **Never** run load tests against production without explicit approval
- **Never** skip smoke tests — always verify functionality before load
- **Always** run from a location with stable, sufficient bandwidth
- **Always** monitor the system under test (not just the test tool output)
- **Always** compare results against previous baseline
- **Always** test with realistic data volumes, not empty databases
