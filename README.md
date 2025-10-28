# RabbitMQ-EKS-project
1. Project Overview:
   Goal:
   1. Provision a resilient Amazon EKS cluster.
   2. Run RabbitMQ inside cluster
   3. Provide two sample python apps: a producer that publishes message and a consumer that receives them.

2. RabbitMQ is a message broker that helps you when you want middleware between different applications or systems, allowing them to communicate with each other by exchanging messages.

  Producer → Exchange → Queue → Consumer.
  1. The producer sends message to Exchange.
  2. The exchange uses routing rules to determine which queue to send the message to.
  3. The consumer retrieves the message from the queue and processes it.


3. Tools Used
   1. python- for producer and consumer scripts
   2. RabbitMQ- Message broker for sending and receiving messages
   3. Docker- for containerization
   4. EKS- To deploy and mange the containers
   5. GitHub Actions- For automating the build and deployment pipeline

4. Infrastructure & Deployment

The infrastructure is created on Amazon EKS (Elastic Kubernetes Service) using Terraform. Terraform provisions the EKS cluster, node groups, networking — allowing consistent and repeatable setup of the environment.

Deployment is automated using GitHub Actions, which builds Docker images for the Producer, Consumer, and RabbitMQ, pushes them to Docker Hub, and then applies Kubernetes manifests to deploy them on EKS. This ensures a smooth CI/CD pipeline from code to running containers.
