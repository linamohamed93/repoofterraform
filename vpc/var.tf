variable "cidr_vpc" {
  type = string
  description = "put the ip address for the vpc"
}


variable "name_vpc" {
  type = string
  description = "put the name for the vpc"
}



variable "name_public" {

  description = "put the name of public subnet"
  type        = string
}


variable "vpc_id" {

}
variable "cidr_public" {

  description = "put the cidr of public subnet"
  type        = string
}

variable "AZ" {


  description = "put the availabilty zone of  subnetss"
  type        = string
}


variable "name_private" {


  description = "put the name of 2 private subnets"
  type        = list(string)
}

variable "cidr_private" {



  description = "put the cidr of 2 private subnets"
  type        = list(string)
}

variable "igw" {


  description = "put the name of internet gateway"
  type        = string
}

variable "route_cidr" {


  description = "put the route cidr of routing"
  type        = string
}
