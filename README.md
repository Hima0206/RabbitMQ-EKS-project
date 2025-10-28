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

3. Tools Used
Python – for Producer and Consumer scripts

RabbitMQ – message broker for sending and receiving messages

Docker – for containerization

Terraform – for infrastructure setup (EKS, VPC, Node Groups)

Kubernetes (EKS) – to deploy and manage the containers

GitHub Actions – for automating the build and deployment pipeline


4. Infrastructure & Deployment

The infrastructure is created on Amazon EKS (Elastic Kubernetes Service) using Terraform. Terraform provisions the EKS cluster, node groups, networking — allowing consistent and repeatable setup of the environment.

Deployment is automated using GitHub Actions, which builds Docker images for the Producer, Consumer, and RabbitMQ, pushes them to Docker Hub, and then applies Kubernetes manifests to deploy them on EKS. This ensures a smooth CI/CD pipeline from code to running containers.
