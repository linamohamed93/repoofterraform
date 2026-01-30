module "create_vpc_subnet"{
    source = "/home/lina/Desktop/infra_project/vpc"
    cidr_vpc = var.VPC_CIDR
    name_vpc = var.VPC_NAME
    cidr_public = var.VPC_PUBLIC_CIDR
    AZ = var.availabilty_ZONE
}