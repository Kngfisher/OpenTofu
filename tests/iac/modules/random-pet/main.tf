terraform {
  required_providers {
    random = {
      source  = "hashicorp/random"
      version = "3.1.2"
    }
  }
}

resource "random_pet" "random_pet" {
  length = var.length
}
