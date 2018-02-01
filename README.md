## Master Thesis - Serverless Architecture

### Titel draft
* Evaluation of function as a service frameworks in private cloud environments based on OpenStack and Kubernetes. 

### Scope
* providing FaaS as part of CCloud for SAP internal consumers

### Frameworks 
##### Requirements
* Based on Container (Docker) and applicable with Kubernetes
* Third party independent
* Open Source
* Dimension: Technical fit, Use cases fit, SAP fit 
  * (Maturity, Performance, Costs of operations u.a.)

##### Framework Selection

1. [OpenWhisk](https://github.com/apache/incubator-openwhisk)
2. [OpenFaas](https://github.com/openfaas/faas)
3. [Fn](https://github.com/fnproject/fn)
4. [Riff](https://github.com/projectriff/riff)
5. [Nuclio](https://github.com/nuclio/nuclio)
6. [Kubeless](https://github.com/kubeless/kubeless)
7. [Fission](https://github.com/fission/fission)
8. [Iron Func](https://github.com/iron-io/functions)


## Research structure

### 0. Summary / Abstract
* Foreword / Personal motivation
* Table of Contents

### 1. Introduction 
`brief overview explaining the background and importance of the study`

* Current State Cloud Computing
* Current Situation at SAP CIS
* What are FaaS, Serverless Arch. (general) -> Area of Research

### 2. Statement of Problem  
`specifically what the researcher wants to know`

* How to react to infrastructure events
  * File processing, new object store created, incoming requests
* Scalability of multi-tenant processes
  * Scaling just pieces of business logic 
* Integrate FaaS in current DevOps framework
* Framework for categorization of functions
  * Managing a large number of functions 
  * Overview issues (which functions does what)
  * Update and redundancy issues
* How to tackle increasing development and testing complexity
* Cost perspective 
  * hidden costs, predictability, comparison with/without FaaS

### 3. Purpose of the Study 
`explanation of the problem and what the researcher hopes to achieve by conducting the study`

* Providing a scalable method to allow consumer to react to infrastructure events 
  * data processing (logs, metric, audit), "new object store file created"
* How could FaaS be used to enhance resource utilization 
* Define and examination of different use cases  
* Which frameworks are available on the market (Evaluation)
  * Dimensions: Technical fit, Use Cases fit, SAP fit 
  * (Maturity, Performance, Costs of operations u.a.)
* General view on Serverless Architecture

### 4. Theoretical framework, research questions, or objectives 
`used to guide the direction of the research`

* Introduce Use Cases (Overview)
* Introduce Frameworks (Overview)
* Research Question like "How do xyz improves current situation"

### 5. Definition of Terms 
`clarification of any terminology in the study that may not be commonly known`

* Serverless, Microservices, Docker, Kubernetes

### 6. Review of the Literature 
`sufficient review of the relevant research` 

### 7. Research Design / Method 
`describes the methods that will be used to collect data or organize creative products.` 

* Describe Design
* Frameworks Criteria, Dimensions, key values
* How could they fit into use cases

### 8. Variables 
`describe aspects of the cases on which data collection and analysis will focus`

### 9. Evaluation / Results
 

### 10. Conclusion
