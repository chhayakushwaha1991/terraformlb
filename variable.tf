variable "ami_id" {
  type = string
}


variable "instance_type_ami" {
  type = string
}

variable "map_ip" {
  type = bool
}

variable "my_port" {
  type = list(number)
}


variable "availability_zone_names" {
  type    = list(string)
}

variable "subnet_cidr" {
  type    = list(string)
}


# variable "asg" {
#   type    = list(string)
# }

# variable "tglb" {
#   type    = list(string)
# }

