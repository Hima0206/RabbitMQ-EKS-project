variable "region" {
  description = "AWS region"
  type        = string
  default     = "ca-central-1"
}

variable "cluster_name" {
  description = "EKS cluster name"
  type        = string
  default     = "rabbitmq-eks-cluster"
}

variable "kubernetes_version" {
  description = "Kubernetes control plane version"
  type        = string
  default     = "1.32"
}

variable "cluster_role_arn" {
  description = "ARN of the IAM role for the EKS cluster"
  type        = string
}


variable "node_role_arn" {
  description = "ARN of the IAM role for EKS managed node group (existing)"
  type        = string
}

variable "vpc_id" {
  description = "Existing VPC id"
  type        = string
}

variable "subnet_ids" {
  description = "List of subnet IDs for the EKS cluster"
  type        = list(string)
}

variable "security_group_ids" {
  description = "List of security group IDs for the EKS cluster"
  type        = list(string)
}
