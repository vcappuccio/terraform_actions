provider "fakewebservices" {
  token = var.provider_token
}

variable "provider_token" {
  type = string
  default = "${{ secrets.TF_API_TOKEN }}"
}
