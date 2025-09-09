# Benchmarking Methodology

## Overview

This document provides a systematic methodology for evaluating and comparing open-source Function-as-a-Service (FaaS) platforms. The framework combines qualitative and quantitative assessment approaches to enable comprehensive technology evaluation.

## 9-Step Benchmarking Process Model

### 1. Statement of Problem

Define the problem to be solved through benchmarking, including business cases, scenarios, or user stories.

### 2. Benchmark Objectives

Identify whether qualitative, quantitative, or both approaches are needed:

- **Qualitative:** Quick overview, empirical assessment
- **Quantitative:** Deeper insights, experimental validation

### 3. Preliminary Investigations

Collect initial information about available open-source FaaS platforms and assess their suitability.

### 4. Identification of Requirements and Constraints

Define functional and non-functional requirements:

**Functional Requirements:**

- Platform must work with Kubernetes
- Support multiple runtime languages
- HTTP event support

**Non-functional Requirements:**

- Open-source license
- Stable version available
- Private cloud compatibility

### 5. Selection of Candidates

Filter platforms based on requirements and select final benchmarking candidates.

### 6. Benchmark Specification

Design either qualitative or quantitative benchmark approach.

### 7. Validation of Benchmark

Ensure the benchmark meets objectives and will produce meaningful results.

### 8. Conduction of Comparative Analysis

Execute the benchmark and collect data.

### 9. Presentation of Results

Process and present results to enable decision-making.

## Qualitative Benchmark Design

### Characteristics Framework

Based on FOSSES (Framework for Open-Source Software Evaluation and Selection):

1. **Survey and collect information** about platforms
2. **Determine fundamental vs negligible characteristics**
3. **Assign metrics** to enable measurement

### Five Key Characteristics

#### 1. Functionality

- **Triggers:** HTTP, Time/Cron, Message Queues
- **Runtime Languages:** Supported programming languages
- **Message Queues:** Request handling mechanisms
- **Scaling Methods:** Auto-scaling approaches

#### 2. Stability

- **Maturity:** Project age and development stage
- **Backed by:** Supporting organizations
- **Development Language:** Implementation language
- **Container Orchestrator:** Underlying platform

#### 3. Usability

- **Documentation Completeness:** Comprehensive, Sufficient, Insufficient
- **Support Channels:** Available help resources
- **CLI Interaction:** Command-line tools
- **Package Manager:** Deployment ease (Helm support)

#### 4. Popularity

- **GitHub Stars:** Community interest
- **Watches:** Active monitoring
- **Forks:** Community contributions
- **Contributors:** Developer ecosystem

#### 5. Activity

- **Commit Frequency:** Development activity (per week)

## Quantitative Benchmark Design

### Architecture Components

```
Workload Generator → FaaS Platform → Metrics Collection
      ↑                  ↑                    ↓
   Automation         Kubernetes          Monitoring
    (Cron)            (Container            (Grafana)
                     Orchestration)
```

### Qualities Under Examination

#### Performance Metrics

- **Request/Response Latency (M1):** Time for request completion
- **Throughput (M2):** Requests processed per second
- **Total Processing Time (M3):** Duration for all requests

#### Elasticity Metrics

- **Container Startup Latency (M4):** Provision overhead
- **Function Invocation Rate (M5):** Request overhead
- **Execution Duration (M6):** Function processing time
- **Container Scaling (M7):** Lifecycle overhead
- **Failure Rate (M8):** Error sensitivity

### Workload Design

**CPU-Intensive Fibonacci Calculation:**
```python
def fib(n):
    if n == 1 or n == 2:
        return 1
    return fib(n-1) + fib(n-2)
```

**Characteristics:**

- Time complexity: O(2^n)
- Recursive implementation
- CPU-intensive with minimal memory usage
- Lightweight and portable

### Measurement Points

1. **Workload Generator:** Performance metrics (M1, M2, M3)
2. **Container Orchestration:** System behavior (M4, M7)
3. **Router Component:** Invocation and failure rates (M5, M8)
4. **Function Container:** Execution insights (M6)

### Experimental Design

**Load Pattern:**

- Fixed 10,000 requests per test
- Incremental concurrency: 1-10 (step 1), 20-50 (step 10), 100-200 (step 50)
- 30-minute cooldown between tests
- Multiple time slots (6am, 2pm, 10pm) over 3 days

**Environment:**

- OpenStack cloud infrastructure
- Kubernetes cluster (2 worker nodes)
- Separate monitoring cluster
- Same private network for minimal latency

## Design Objectives

### Relevance

- Realistic scenarios
- Meaningful data generation
- Representative workloads

### Reproducibility/Repeatability

- Consistent results across time
- Minimal environmental assumptions
- Documented configurations

### Fairness

- Equal treatment of all platforms
- No platform-specific optimizations
- General evaluation criteria

### Portability

- Applicable to other systems
- Limited platform dependencies
- Standardized metrics

### Understandability

- Clear methodology
- Accessible results
- Minimal background knowledge required

## Validation Criteria

**Qualitative Benchmark:**

- Covers relevant platform characteristics
- Enables meaningful comparison
- Supports selection decisions

**Quantitative Benchmark:**

- Measures intended qualities (performance, elasticity)
- Provides actionable insights
- Follows experimental best practices
