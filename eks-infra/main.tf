resource "aws_eks_cluster" "eks_cluster" {
  name     = var.cluster_name
  role_arn = var.cluster_role_arn
  version  = var.kubernetes_version

  vpc_config {
    subnet_ids = var.subnet_ids
    security_group_ids = var.security_group_ids
  }           
}  

resource "aws_eks_node_group" "eks_node_group" {
    cluster_name    = aws_eks_cluster.eks_cluster.name
    node_group_name = "${var.cluster_name}-node-group"  
    node_role_arn   = var.node_role_arn
    subnet_ids      = var.subnet_ids  
    scaling_config {
      desired_size = 3
      max_size = 4
      min_size = 1
    }
    
    instance_types = ["t3.micro"]
    capacity_type =  "ON_DEMAND"
    depends_on = [ aws_eks_cluster.eks_cluster ]
}

output "cluster_name" {
  value       = aws_eks_cluster.eks_cluster.name
}

output "cluster_endpoint" {
  value = aws_eks_cluster.eks_cluster.endpoint
}

output "cluster_ca_certificate" {
  value = aws_eks_cluster.eks_cluster.certificate_authority[0].data
}