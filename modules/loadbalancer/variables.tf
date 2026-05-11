variable "name" {
  type = string
}

variable "instance_group" {
  type = string
}

variable "fqdn" {
  type = string
}

variable "path_rules" {

  type = list(object({
    paths   = list(string)
    service = string
  }))
}
