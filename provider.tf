#provider.tf

variable "provider_token" {
  type = string
  sensitive = true
  default = "dummy_value"
}

provider "fakewebservices" {
  token = var.provider_token
}