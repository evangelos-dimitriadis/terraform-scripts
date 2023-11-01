terraform {
  required_version = ">= 1.5.7"

  # backend "s3" {
  #   key            = "tfstate"
  #   bucket         = "terraform-20231006"
  #   region         = "us-east-1"
  #   dynamodb_table = "terraform_locks"
  #   encrypt        = true
  # }
  backend "remote" {
    hostname     = "app.terraform.io"
    organization = "evangelos_dimitriadis"
    workspaces {
      name = "aws-example"
    }
  }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.19.0"
    }
    http = {
      source  = "hashicorp/http"
      version = ">= 3.0.0"
    }
    random = {
      source  = "hashicorp/random"
      version = ">= 3.0.0"
    }
    local = {
      source  = "hashicorp/local"
      version = ">= 2.1.0"
    }
    tls = {
      source  = "hashicorp/tls"
      version = "> 3.1.0"
    }
  }
}

