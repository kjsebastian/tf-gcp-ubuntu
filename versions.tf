provider "google" {
  project = "dm-convert"
}

terraform {
  required_providers {
    google = {
      version = "> 3.83.0"
    }
  }
}