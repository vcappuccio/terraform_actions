provider "fakewebservices" {
  token = var.provider_token
}

variable "provider_token" {
  type = string
}
