# backend.tf
terraform {
  cloud {
    organization = "example-org-358622"

    workspaces {
      name = "terraform-github-actions"
    }
  }
}