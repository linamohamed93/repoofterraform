variable "VPC_CIDR" {
    default = "10.0.0.0/16"
}

variable "VPC_NAME" {
    default = "GAME_VPC"
}
variable "availabilty_ZONE" {
  default = ["us-east-1a","us-east-1b","us-east-1c"]
}

variable "VPC_PUBLIC_CIDR" {
  default = "10.0.1.0/24"
}

