
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.9.0"
    }

    external = {
      source  = "hashicorp/external"
      version = "~> 1.2.0"
    }

    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "~> 1.12.0"
    }

    kustomization = {
      source  = "kbst/kustomization"
      version = ">= 0.2"
    }

    template = {
      source  = "hashicorp/template"
      version = "~> 2.1.2"
    }
  }

  required_version = ">= 0.13"
}
