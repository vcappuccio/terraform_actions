# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

terraform {
  required_providers {
    fakewebservices = "~> 0.1"
  }
}

variable "provider_token" {
  type        = string
  description = "The provider token for authentication"
}

provider "fakewebservices" {
  token = var.provider_token
}
