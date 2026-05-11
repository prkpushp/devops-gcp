variable "name" {
  type = string
}


variable "web_instance_group" {}

variable "api_instance_group" {}

variable "fqdn" {
  type = string
}

variable "path_rules" {

  type = list(object({
    paths   = list(string)
    service = string
  }))
}
