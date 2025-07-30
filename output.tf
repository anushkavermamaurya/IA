output "project_id" {
  description = "The project ID"
  value       = var.project_id
}

output "region" {
  description = "The region"
  value       = var.region
}

output "shared_vpc_name" {
  description = "Name of the shared VPC"
  value       = module.networking.shared_vpc_name
}

output "client_vpc_name" {
  description = "Name of the client VPC"
  value       = module.networking.client_vpc_name
}

output "gke_cluster_name" {
  description = "Name of the GKE cluster"
  value       = module.compute.gke_cluster_name
}

output "gke_cluster_endpoint" {
  description = "Endpoint of the GKE cluster"
  value       = module.compute.gke_cluster_endpoint
  sensitive   = true
}

output "load_balancer_ip" {
  description = "IP address of the load balancer"
  value       = module.compute.load_balancer_ip
}

output "apigee_instance_name" {
  description = "Name of the Apigee instance"
  value       = module.apigee.apigee_instance_name
}

output "cloud_nat_name" {
  description = "Name of the Cloud NAT"
  value       = module.networking.cloud_nat_name
}

output "artifact_registry_url" {
  description = "URL of the Artifact Registry"
  value       = module.storage.artifact_registry_url
}

output "kms_key_id" {
  description = "ID of the KMS key"
  value       = module.security.kms_key_id
}
