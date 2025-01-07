variable "region" {
  type = string
}

variable "tags" {
  type = map(string)
}

variable "bucket_names" {
  type = list(string)
}

variable "vpc_cidr" {
  type = string
}

variable "public_subnet_1_cidr" {
  type = string
}

variable "public_subnet_2_cidr" {
  type = string
}

variable "private_subnet_1_cidr" {
  type = string
}

variable "private_subnet_2_cidr" {
  type = string
}

variable "EC2_AMI" {
  type = string
}

variable "EC2_size" {
  type = string
}


