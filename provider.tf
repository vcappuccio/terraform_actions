# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

terraform {
  required_providers {
    fakewebservices = "~> 0.1"
  }

}

provider "fakewebservices" {
  token = var.provider_token
}
