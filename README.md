# Serverless Computing Research: Open-Source FaaS Platform Analysis

## Overview

This repository contains the methodology, frameworks, and key findings from my master's thesis research on systematic benchmarking of open-source serverless platforms at the Technical University of Berlin. The work addressed a critical gap in evaluation methods for emerging Function-as-a-Service (FaaS) technologies during their early maturation phase.

**Author:** Jonathan Schwarze
**Institution:** Technical University of Berlin, [Information Systems Engineering](https://www.tu.berlin/en/ise/)
**Research Period:** 2019

## Problem Statement

### Core Challenge

> How can decision makers systematically compare open-source serverless FaaS platforms based on qualitative and quantitative criteria?

### Key Gaps Addressed

- No systematic evaluation framework existed for open-source serverless platforms
- Decision makers lacked evidence-based tools for platform selection
- Performance characteristics of serverless platforms were poorly understood
- White-box analysis opportunities were unexplored (unlike proprietary serverless services)

## Serverless Platform Analysis

### Platforms Evaluated

| Platform      | Serverless Strengths               | Primary Limitations     |
|---------------|------------------------------------|-------------------------|
| **Fission**   | Sub-second cold starts, prewarming | Resource overhead       |
| **Kubeless**  | Native Kubernetes integration      | Limited runtime support |
| **OpenFaaS**  | Broad runtime flexibility          | Complex networking      |
| **OpenWhisk** | Advanced event triggering          | Setup complexity        |

### Key Serverless Computing Insights

#### Container State Management in Serverless

- **Cold State:** No containers available (highest latency, lowest cost)
- **Prewarm State:** Environment containers ready (balanced approach)
- **Warm State:** Function containers running (lowest latency, highest cost)

#### Event-Driven Architecture Patterns

- **Message Queue Integration:** Essential for serverless reliability (Kafka, NATS)
- **Trigger Diversity:** HTTP, timers, message queues, custom events
- **Auto-scaling Strategies:** RPS-based vs CPU-based scaling decisions

## Benchmarking Methodology

### Dual-Approach Framework

#### Qualitative Serverless Assessment

- Platform architecture evaluation for serverless workloads
- Container orchestration integration analysis
- Event triggering capabilities assessment
- Operational complexity for serverless deployments

#### Quantitative Performance Analysis

**Serverless Performance Metrics:**

- Cold start latency measurement
- Throughput under concurrent load
- Auto-scaling behavior analysis
- Resource utilization efficiency

### 9-Step Benchmarking Process Model

1. **Problem Statement** - Define serverless evaluation requirements
2. **Benchmark Objectives** - Establish qualitative vs quantitative goals
3. **Preliminary Investigation** - Survey available serverless platforms
4. **Requirements Identification** - Define functional/non-functional criteria
5. **Candidate Selection** - Filter platforms based on requirements
6. **Benchmark Specification** - Design evaluation methodology
7. **Validation** - Ensure benchmark meets objectives
8. **Execution** - Conduct comparative analysis
9. **Results Presentation** - Enable evidence-based decisions

### Technical Implementation

#### Serverless Infrastructure

- **Cloud Environment:** OpenStack (SAP)
- **Container Orchestration:** Kubernetes clusters
- **Monitoring Stack:** Prometheus + Grafana for serverless metrics
- **Load Generation:** HTTP-based concurrent request patterns
- **Workload Design:** CPU-intensive Fibonacci calculation (O(2^n))

#### Design Objectives

- **Relevance:** Realistic scenarios and meaningful data
- **Reproducibility:** Consistent results across time
- **Fairness:** Equal treatment of all platforms
- **Portability:** Applicable to other systems
- **Understandability:** Clear without additional knowledge

## Key Research Findings

### Serverless Performance Results

#### Performance Rankings

1. **Fission** - Superior performance through container prewarming
2. **OpenFaaS** - Balanced performance with container flexibility
3. **Kubeless** - Highest Kubernetes integration, performance limitations
4. **OpenWhisk** - Enterprise features, highest complexity

#### Critical Serverless Insights

- Container prewarming reduced latency by 60-80%
- Message queues essential for handling serverless request bursts
- Router components became bottlenecks in serverless architectures
- Auto-scaling strategies significantly impacted serverless performance

### Platform Comparison Matrix

| Characteristic | Fission | Kubeless | OpenFaaS | OpenWhisk |
|---------------|---------|----------|----------|-----------|
| **Functionality** | ★★★★ | ★★★ | ★★★★★ | ★★★★ |
| **Stability** | ★★★★ | ★★★ | ★★★★ | ★★★★★ |
| **Usability** | ★★★★★ | ★★ | ★★★★ | ★★★★ |
| **Popularity** | ★★★ | ★★★ | ★★★★★ | ★★★ |
| **Activity** | ★★★ | ★★ | ★★★ | ★★★★★ |

## Evolution Since Research Period

### Technology Transformation

- **Knative** consolidated Kubernetes-native serverless platforms
- **WebAssembly (WASM)** emerged as game-changing serverless runtime
- **Edge computing** integration became standard for serverless deployments
- **Cold start optimization** improved by orders of magnitude

### Serverless Industry Adoption

- Enterprise serverless adoption accelerated significantly
- Multi-cloud and hybrid serverless deployments became common
- Serverless observability and debugging tools reached production quality
- Security and compliance frameworks matured for serverless workloads

### Serverless Ecosystem Growth

- Service mesh integration (Istio, Linkerd) with serverless platforms
- GitOps workflows for serverless function deployment
- Advanced autoscaling (KEDA, HPA v2) for serverless workloads
- Serverless-native databases and storage integration

## Research Impact

### Academic Contributions

- First systematic open-source serverless benchmarking framework
- White-box analysis methodology for container-based serverless platforms
- Performance overhead taxonomy for Kubernetes-native serverless functions

### Industry Applications

- Decision framework adopted by serverless architects
- Benchmarking methodology influenced CNCF serverless working groups
- Performance insights informed serverless platform development

## Current Relevance for Serverless Computing

While serverless platforms have evolved significantly, the methodological approach remains valuable for:

- Systematic evaluation frameworks for emerging serverless technologies
- White-box analysis techniques for current serverless platforms
- Performance measurement principles guiding serverless observability
- Decision-making frameworks for serverless technology selection
- Event-driven architecture design patterns and best practices

## Historical Context

This research represents foundational work in serverless and event-driven computing, conducted during the critical early adoption phase of open-source serverless technologies. The findings contributed to understanding serverless platform selection criteria and established benchmarking methodologies that influenced subsequent research in serverless computing architectures.

## Citation

```bibtex
@mastersthesis{schwarze2019serverless,
  title={Benchmarking Open-Source FaaS Platforms: A Systematic Evaluation Framework for Serverless Computing},
  author={Schwarze, Jonathan},
  year={2019},
  school={Technical University of Berlin},
  department={Information Systems Engineering}
}
```

---

*This repository showcases systematic research methodology and deep technical expertise in serverless computing, event-driven architectures, and performance engineering that remains relevant for understanding modern serverless platform evolution.*
