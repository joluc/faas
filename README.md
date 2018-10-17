## Performance analysis of open-source serverless platforms

### Introduction
Serverless architectures have become popular in recent years. In serverless environments, developers providing code to a platform without concerning about the underlying infrastructure. The code is invoked by events and runs in stateless compute containers. This approach optimizes resource utilization, lead to higher scalability and diminishes computing costs [1].
Besides proprietary, closed-source serverless solutions like Amazon Lambda [2], Google Cloud Functions [3] or Microsoft Azure Functions [4], several open-source serverless platforms have been launched on the market. In comparison, they offer more freedom regarding where to deploy the platform. They can be implemented in private or public clouds, virtual servers or on bare-metal server on-premise. Furthermore, thanks to its open nature, it enables developers and a community to extend and customize the platforms. It gives full control over the platforms.
Hence, provider and owner of infrastructure are interested in open-source platforms in order to implement an own serverless solution based on an open-source platform. However, the challenge for them is to find the right platform for their use cases and needs.

### Statement of Problem
Current open-source serverless platforms are different in their architecture. Even though all of them follow the same serverless paradigm, they differ significantly in structure, handling of the life-cycle of containers or support of different programming languages.
In order to choose a specific platform for implementation, there is a need for an objective comparison. One method to support the selection decision is a benchmark of open-source serverless platforms. Currently, there is no standardized and general benchmark for open-source serverless platforms available [5]. The SPEC serverless defined already criteria for a benchmark and is working on an implementation [6]. The authors of the vision paper: "A SPEC RG Cloud Group's Vision on the Performance Challenges of FaaS Cloud Architectures"[5] identified three leading causes of the absence of a general serverless benchmark: the complexity of the systems, difficult quantification of aspects and dependencies between components which may interfering the results.

#### Approach
The main objective of this thesis is to compare the performance of open-source serverless platforms based on a benchmark designed for serverless.
In the first step, I will conduct a market research about existing open-source serverless solutions. I will classify and categorize them according to defined criteria. This step will give an overview of the current status quo in the serverless landscape. Based on the result, I will select the most representative platforms for further investigation. This selection is made based on several factors: the activity of the community and developers around the platform, its maintenance, company support of the platform, container orchestration systems dependency or independence among other factors.
The next step will start with a general overview on benchmarks followed by a zoom on relevant serverless aspects. Following this, I will introduce benchmark criteria for serverless which will build the foundation of my experiments. The experiment will consist of several performance tests which will verify or disprove defined hypotheses regarding the performance of serverless and its influencing parameters. The tests and their measurements will be conducted on the Converged Cloud, the private managed cloud of SAP. I will consider four types of serverless jobs, which are defined by SPECserverless [6]: CPU-, Memory intensive jobs, data- and network heavy jobs. For each job, I will write an example program which will be executed and monitored. The generated data allows a performance comparison of the examined platforms. For the benchmark, I will use an HTTP based benchmarking tool which generates a significant load for the examination. The benchmarking tool will be implemented on a machine separated from the serverless platforms but within the same private network or region. This will lead to a general evaluation of the generated results. The last step of my thesis will consist of a proposal of a generic benchmarking approach for open-source serverless platforms.


#### References
[1] CNCF WG-Serverless Whitepaper, accessed February 22, 2018, source:
https://docs.google.com/document/d/1UjW8bt5O8QBgQRILJVKZJej_IuNnxl20AJu9wA8wcdI

[2] AWS Lambda, source:
https://aws.amazon.com/lambda/

[3] Google Cloud Functions, source:
https://cloud.google.com/functions/

[4] Azure Functions, source:
https://azure.microsoft.com/en-us/services/functions/

[5] A SPEC RG Cloud Group's Vision on the Performance Challenges of FaaS Cloud Architectures, accessed March 12, 2018, source:
https://dl.acm.org/citation.cfm?id=3186308

[6] CF Serverless: Attempts at a Benchmark for Serverless Computing, accessed Mai 14, 2018, source:
https://docs.google.com/document/d/1e7xTz1P9aPpb0CFZucAAI16Rzef7PWSPLN71pNDa5jg/edit# 
