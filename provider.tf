# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

provider "fakewebservices" {
  token = var.provider_token
}

variable "provider_token" {
  type        = string
  description = "The provider token for authentication"
}
