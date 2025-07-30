variable "project_id" {
  description = "The GCP project ID"
  type        = string
  default     = "prj-gcp-ia-network-devenvironment"
}

variable "region" {
  description = "The GCP region (Saudi Arabia - Dammam)"
  type        = string
  default     = "me-central2"
}

variable "zone" {
  description = "The GCP zone within the region"
  type        = string
  default     = "me-central2-a"
}

variable "environment" {
  description = "Environment name"
  type        = string
  default     = "dev"
}

variable "organization_id" {
  description = "The GCP organization ID"
  type        = string
  default     = ""
}

variable "billing_account" {
  description = "The billing account ID"
  type        = string
  default     = ""
}

variable "shared_vpc_cidr" {
  description = "CIDR range for shared VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "client_vpc_cidr" {
  description = "CIDR range for client VPC"
  type        = string
  default     = "10.1.0.0/16"
}

variable "trusted_subnet_cidr" {
  description = "CIDR range for trusted subnet"
  type        = string
  default     = "10.0.1.0/24"
}

variable "https_subnet_cidr" {
  description = "CIDR range for HTTPS subnet"
  type        = string
  default     = "10.0.2.0/24"
}

variable "gke_subnet_cidr" {
  description = "CIDR range for GKE subnet"
  type        = string
  default     = "10.0.3.0/24"
}

variable "apigee_peering_cidr" {
  description = "CIDR range for Apigee peering"
  type        = string
  default     = "10.0.4.0/22"
}

variable "labels" {
  description = "Common labels to apply to resources"
  type        = map(string)
  default = {
    environment = "dev"
    project     = "apigee-x-runtime"
    region      = "me-central2"
    managed-by  = "terraform"
  }
}
