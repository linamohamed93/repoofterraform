// create vpc 
resource "aws_vpc" "main" {
  cidr_block       = var.cidr_vpc
  tags = {
    Name = var.name_vpc
  }
}

// create one public subnet 
resource "aws_subnet" "public" {
  vpc_id     = var.cidr_vpc
  cidr_block = var.cidr_public
  availability_zone       = var.AZ
  tags = {
    Name = var.name_public
  }

}

//create numbers of private subnets depends on numbers of cidr (3)
resource "aws_subnet" "private" {
  count          = length(var.cidr_private)
  vpc_id     = var.cidr_vpc
  cidr_block = var.cidr_private[count.index]
  availability_zone       = var.AZ
  tags = {
    Name = var.name_private[count.index]
  }
 
}

// create internet gateway andd relatd to vpc
resource "aws_internet_gateway" "igw" {
  vpc_id     = var.cidr_vpc

  tags = {
    Name = var.igw
  }
}


// create public route table and  assign into internet gateway
resource "aws_route_table" "public_route" {
 vpc_id     = var.cidr_vpc

  route {
    cidr_block = var.route_cidr
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "public_route"
  }
}

// Assign public route table into public subnet
resource "aws_route_table_association" "public_assoc" {

  subnet_id      = aws_subnet.public.id
  route_table_id = aws_route_table.public_route.id
}


// generte nat gateway
resource "aws_eip" "nat" {
  domain = "vpc"
}


// Assign nat gateway into public subnet 
resource "aws_nat_gateway" "natgw" {
  allocation_id = aws_eip.nat.id
  subnet_id     = aws_subnet.public.id

  tags = {
    Name = "main-nat"
  }


}

// create private route table and related to nat gateway
resource "aws_route_table" "private_route" {
  vpc_id     = var.cidr_vpc

  route {
    cidr_block = var.route_cidr
    nat_gateway_id  = aws_nat_gateway.natgw.id
  }

  tags = {
    Name = "private_route"
  }
}

// Assign private route table into private subnet
resource "aws_route_table_association" "private_assoc" {
  count          = length(aws_subnet.private)
  subnet_id      = aws_subnet.private[count.index].id
  route_table_id = aws_route_table.private_route.id
}