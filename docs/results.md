# Results Analysis

## Executive Summary

The benchmarking study revealed significant performance differences among open-source FaaS platforms in 2019, with container prewarming strategies and architectural design choices playing crucial roles in platform performance and scalability.

## Key Research Findings

### Performance Rankings (2019)

1. **Fission (Best Performance)**
   - Fastest total processing time (~1.6s average)
   - Highest throughput (142 req/s at 10 concurrent)
   - Lowest latency due to prewarming
   - Best suited for high-performance scenarios

2. **OpenFaaS (Moderate Performance)**
   - Balanced performance with flexibility
   - Improved with increasing concurrency
   - Most popular platform (13,010 GitHub stars)
   - Best for Docker container flexibility

3. **Kubeless (Lowest Performance)**
   - Highest Kubernetes integration
   - Performance limitations with scaling
   - Significant failure rate under load
   - Suitable for small-scale automation

4. **OpenWhisk (Qualitative Only)**
   - Most complex architecture
   - Enterprise-grade features
   - Highest commit activity (9 commits/week)
   - IBM backing and mature ecosystem

## Quantitative Analysis Results

### Total Processing Time

- **Fission:** Consistent ~2s with minimal variation
- **OpenFaaS:** 12.4s → 4.3s (64% improvement with concurrency)
- **Kubeless:** High fluctuation, increasing with load

### Request/Response Latency

- **Hypothesis H2 Confirmed:** Latency increases with concurrent requests
- **Fission:** Steady, predictable increase
- **OpenFaaS:** Moderate latency growth
- **Kubeless:** Nearly constant (due to request rejection)

### Throughput Patterns

- **Hypothesis H1 Partially Confirmed:** Throughput decreases, then increases due to failures
- **Fission:** Peak 142 req/s
- **OpenFaaS:** Peak 36 req/s
- **Kubeless:** Peak 30 req/s

### Container Scaling Behavior

- **Hypothesis H3 Confirmed:** Prewarming reduces latencies
- **Fission:** 3 prewarmed containers by default
- **OpenFaaS/Kubeless:** 1 warm container by default
- **Scaling Methods:**
  - Fission: RPS-based + HPA
  - OpenFaaS: Alertmanager (RPS)
  - Kubeless: HPA (CPU-based)

## Qualitative Comparison Matrix

| Characteristic | Fission | Kubeless | OpenFaaS | OpenWhisk |
|---------------|---------|----------|----------|-----------|
| **Functionality** | ★★★★ | ★★★ | ★★★★★ | ★★★★ |
| **Stability** | ★★★★ | ★★★ | ★★★★ | ★★★★★ |
| **Usability** | ★★★★★ | ★★ | ★★★★ | ★★★★ |
| **Popularity** | ★★★ | ★★★ | ★★★★★ | ★★★ |
| **Activity** | ★★★ | ★★ | ★★★ | ★★★★★ |

### Platform Strengths & Weaknesses

#### Fission

**Strengths:**
- Superior performance through prewarming
- Comprehensive documentation
- Native Kubernetes integration
- Effective request processing

**Weaknesses:**
- Higher idle costs (3 containers)
- Platform9 dependency
- Limited trigger variety

#### Kubeless

**Strengths:**
- Highest Kubernetes integration
- Lowest complexity
- Native CRD usage
- Bitnami backing

**Weaknesses:**
- Performance limitations
- High failure rate
- Insufficient documentation
- No message queue by default

#### OpenFaaS

**Strengths:**
- Maximum flexibility (any Docker container)
- Largest community
- Multi-orchestrator support
- Rich trigger ecosystem

**Weaknesses:**
- Performance trade-offs
- Complex scaling behavior
- Higher resource consumption

#### OpenWhisk

**Strengths:**
- Enterprise-grade features
- IBM backing
- Most comprehensive trigger support
- Mature architecture

**Weaknesses:**
- Highest complexity
- Multiple component dependencies
- Not Kubernetes-native
- Setup complexity

## Container State Analysis

### Three Container States Identified

1. **Cold State**
   - No containers available
   - Full startup sequence required
   - Highest latency, lowest cost

2. **Prewarm State** (Fission only)
   - Environment containers ready
   - Function injection on demand
   - Balanced latency/cost trade-off

3. **Warm State** (OpenFaaS, Kubeless)
   - Function containers running
   - Immediate execution
   - Lowest latency, highest cost

### Scaling Strategy Impact

**Request-based Scaling (RPS):**
- Fission, OpenFaaS, OpenWhisk
- Faster response to load changes
- Better for bursty workloads

**Resource-based Scaling (CPU):**
- Kubeless (HPA)
- Slower reaction time
- Better for sustained loads

## Architecture Insights

### Message Queue Importance

- **Kafka/NATS users:** Lower failure rates
- **No queue (Kubeless):** Higher failure rates
- **Impact:** Request buffering critical for reliability

### Router Bottlenecks

- NGINX ingress controller limitations
- 502 Bad Gateway errors under load
- Router component as system bottleneck

### Performance vs Complexity Trade-off

- More components = better performance
- Increased operational complexity
- Prewarming optimal for latency/cost balance

## Historical Context & Evolution

### 2019 State vs Current Expectations

- Platforms were emerging technologies
- Limited standardization
- Kubernetes becoming the standard
- Performance optimization in early stages

### Validated Assumptions

- Container prewarming strategies effective
- Message queues essential for reliability
- Router components as potential bottlenecks
- Scaling strategy significantly impacts performance

## Lessons for Event-Driven Computing

### Design Patterns Identified

1. **Prewarming Pattern:** Performance vs cost optimization
2. **Message Queue Pattern:** Reliability under load
3. **Multi-trigger Pattern:** Event source flexibility
4. **Container Lifecycle Pattern:** State management strategies

### Performance Optimization Insights

- Cold start mitigation through prewarming
- Horizontal scaling requires careful trigger selection
- Load balancing critical for multi-container scenarios
- Monitoring essential for performance validation

### Platform Selection Framework

Based on use case requirements:

**High Performance Needs:** Fission
**Maximum Flexibility:** OpenFaaS
**Kubernetes Integration:** Kubeless
**Enterprise Features:** OpenWhisk

## Research Limitations

### Scope Constraints (2019)

- Single workload type (CPU-intensive)
- Private cloud environment
- Limited concurrent user testing
- Kubernetes-only evaluation

### Environmental Factors

- Fixed resource allocation
- Network proximity effects
- Time-based variation testing
- Single geographic region

### Platform Maturity

- Early adoption phase platforms
- Limited production deployments
- Evolving architectural patterns
- Documentation gaps

## Future Research Directions

### Immediate Extensions

- Multi-workload benchmarking
- Cross-cloud provider testing
- Long-term stability assessment
- Real-world application scenarios

### Advanced Topics

- Cold start prediction with ML
- Auto-scaling optimization
- Multi-tenant performance
- Edge computing integration

This analysis provides a comprehensive view of the open-source FaaS landscape as it existed in 2019, offering insights that remain relevant for understanding the evolution of serverless computing platforms.
