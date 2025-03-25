
variable "zone-name" {
  type = string
}
variable "compute_instance_name" {
  type = list(string)
}

variable "source_instance_name" {
  type = list(string)
}
variable "source_image_name" {
  type = list(string)
}
variable "instance_count" {
  type    = number
  default = 2
}
variable "project-id" {
  type = string
}