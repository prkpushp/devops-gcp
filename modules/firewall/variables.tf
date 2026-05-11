variable "network" {
  type = string
}

variable "name" {
  type    = string
  default = "allow-ssh-http"
}

variable "ports" {
  type    = list(string)
  default = ["22", "80"]
}

variable "source_ranges" {
  type    = list(string)
  default = ["0.0.0.0/0"]
}

variable "target_tags" {
  type    = list(string)
  default = ["web-server"]
}
