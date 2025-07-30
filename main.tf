terraform {
  required_version = ">= 1.5"
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 5.0"
    }
    google-beta = {
      source  = "hashicorp/google-beta"
      version = "~> 5.0"
    }
  }
}

provider "google" {
  project = var.project_id
  region  = var.region
  zone    = var.zone
}

provider "google-beta" {
  project = var.project_id
  region  = var.region
  zone    = var.zone
}

# Enable required APIs
resource "google_project_service" "required_apis" {
  for_each = toset([
    "compute.googleapis.com",
    "container.googleapis.com",
    "servicenetworking.googleapis.com",
    "apigee.googleapis.com",
    "dns.googleapis.com",
    "cloudkms.googleapis.com",
    "secretmanager.googleapis.com",
    "artifactregistry.googleapis.com",
    "cloudbuild.googleapis.com",
    "monitoring.googleapis.com",
    "logging.googleapis.com",
    "cloudresourcemanager.googleapis.com",
    "iam.googleapis.com",
    "securitycenter.googleapis.com",
    "binaryauthorization.googleapis.com",
    "certificatemanager.googleapis.com"
  ])
  
  service = each.value
  project = var.project_id
  
  disable_dependent_services = true
  disable_on_destroy         = false
}

# Call networking module
module "networking" {
  source = "./modules/networking"
  
  project_id    = var.project_id
  region        = var.region
  zone          = var.zone
  environment   = var.environment
  
  depends_on = [google_project_service.required_apis]
}

# Call security module
module "security" {
  source = "./modules/security"
  
  project_id    = var.project_id
  region        = var.region
  environment   = var.environment
  
  network_name = module.networking.shared_vpc_name
  
  depends_on = [google_project_service.required_apis]
}

# Call compute module
module "compute" {
  source = "./modules/compute"
  
  project_id    = var.project_id
  region        = var.region
  zone          = var.zone
  environment   = var.environment
  
  shared_vpc_name    = module.networking.shared_vpc_name
  trusted_subnet     = module.networking.trusted_subnet_name
  https_subnet       = module.networking.https_subnet_name
  
  depends_on = [
    google_project_service.required_apis,
    module.networking
  ]
}

# Call Apigee module
module "apigee" {
  source = "./modules/apigee"
  
  project_id    = var.project_id
  region        = var.region
  environment   = var.environment
  
  shared_vpc_name = module.networking.shared_vpc_name
  peering_range   = module.networking.apigee_peering_range
  
  depends_on = [
    google_project_service.required_apis,
    module.networking
  ]
}

# Call storage module
module "storage" {
  source = "./modules/storage"
  
  project_id    = var.project_id
  region        = var.region
  environment   = var.environment
  
  depends_on = [google_project_service.required_apis]
}

# Call monitoring module
module "monitoring" {
  source = "./modules/monitoring"
  
  project_id    = var.project_id
  region        = var.region
  environment   = var.environment
  
  depends_on = [google_project_service.required_apis]
}
