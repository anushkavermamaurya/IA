# Project Configuration
project_id = "prj-gcp-ia-network-devenvironment"
region     = "me-central2"
zone       = "me-central2-a"
environment = "dev"

# Network Configuration
shared_vpc_cidr      = "10.0.0.0/16"
client_vpc_cidr      = "10.1.0.0/16"
trusted_subnet_cidr  = "10.0.1.0/24"
https_subnet_cidr    = "10.0.2.0/24"
gke_subnet_cidr      = "10.0.3.0/24"
apigee_peering_cidr  = "10.0.4.0/22"

# Labels
labels = {
  environment = "dev"
  project     = "apigee-x-runtime"
  region      = "me-central2"
  managed-by  = "terraform"
  location    = "saudi-arabia"
}
