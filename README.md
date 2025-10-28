# RabbitMQ-EKS-project
1.	PROJECT OVERVIEW.
Goal:
•	Provision a resilient Amazon EKS cluster.
•	Run RabbitMQ inside the cluster (accessible to apps in same namespace).
•	Provide two sample Python apps: a producer that publishes messages and a consumer that receives them.
Simple architecture:
•	EKS cluster (private control plane, public worker nodes or managed node groups)
•	Namespace messaging
o	RabbitMQ (StatefulSet via Helm chart) + Service (ClusterIP)
o	producer Deployment
o	consumer Deployment
Apps communicate with RabbitMQ using the internal cluster DNS or via a Kubernetes service name.

2.RabbitMQ is a message broker that helps you when you want middleware between different applications or systems, allowing them to communicate with each other by exchanging messages.

Producer → Exchange → Queue → Consumer.


• The producer sends a message to an exchange.
• The exchange uses routing rules to determine which queue(s) to send the message to.
• The consumer retrieves the message from the queue and processes it.

3. Dependencies
| Component          | Version    | Description                                                         |
| ------------------ | ---------- | ------------------------------------------------------------------- |
| **Python**         | 3.11       | Used for writing Producer and Consumer applications                 |
| **Docker**         | 24.0+      | Used to containerize the Producer and Consumer                      |
| **RabbitMQ**       | 3.8.3-rc.1 | Message broker used for communication between Producer and Consumer |
| **Pika**           | 1.3.2      | Python client library for RabbitMQ                                  |
| **Terraform**      | 1.4        | Used for provisioning AWS EKS cluster and node groups               |
| **AWS CLI**        | 2.31       | Used to interact with AWS services and configure EKS                |
| **kubectl**        | 1.32       | Used to manage Kubernetes resources                                 |
| **GitHub Actions** | —          | CI/CD tool used for automated build and deployment                  |
| **AWS EKS**        | —          | Managed Kubernetes service for running workloads                    |

4. Infrastructure & Deployment

The infrastructure is created on Amazon EKS (Elastic Kubernetes Service) using Terraform. Terraform provisions the EKS cluster, node groups, networking — allowing consistent and repeatable setup of the environment.

Deployment is automated using GitHub Actions, which builds Docker images for the Producer, Consumer, and RabbitMQ, pushes them to Docker Hub, and then applies Kubernetes manifests to deploy them on EKS. This ensures a smooth CI/CD pipeline from code to running containers.
