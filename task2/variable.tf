variable "region" {
  default = "ap-south-1"   # Mumbai
}

variable "environment" {
  default = "dev"
}

variable "instance_type" {
  default = "t2.micro"
}

variable "ami_id" {
  default = "ami-0f58b397bc5c1f2e8"   
}

variable "key_name" {
  default = "my-keypair"   
}

variable "desired_capacity" {
  default = 2
}
