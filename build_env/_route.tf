# Public Route Table
resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.main_vpc.id

  tags = {
    Name = "${var.tags["name"]}-public-route-table"
  }
}

# Route entry for public route table
resource "aws_route" "public_route" {
  route_table_id         = aws_route_table.public_route_table.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.igw.id
}

# Associate Public Subnet 1 with the route table
resource "aws_route_table_association" "public_subnet_1_association" {
  subnet_id      = aws_subnet.public_subnet_1.id
  route_table_id = aws_route_table.public_route_table.id
}

# Associate Public Subnet 2 with the same route table
resource "aws_route_table_association" "public_subnet_2_association" {
  subnet_id      = aws_subnet.public_subnet_2.id
  route_table_id = aws_route_table.public_route_table.id
}

# private Route Table
resource "aws_route_table" "private_route_table" {
  vpc_id = aws_vpc.main_vpc.id

  tags = {
    Name = "${var.tags["name"]}-private-route-table"
  }
}

# Route entry for private route table
resource "aws_route" "private_route" {
  route_table_id         = aws_route_table.private_route_table.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_nat_gateway.nat_gateway_1.id
}

# Associate private Subnet 1 with the route table
resource "aws_route_table_association" "private_subnet_1_association" {
  subnet_id      = aws_subnet.private_subnet_1.id
  route_table_id = aws_route_table.private_route_table.id
}

# Associate private Subnet 2 with the same route table 
resource "aws_route_table_association" "private_subnet_2_association" {
  subnet_id      = aws_subnet.private_subnet_2.id
  route_table_id = aws_route_table.private_route_table.id
}

# EIP for NAT Gateway
resource "aws_eip" "eip_nat_gateway_1" {
  domain = "vpc"
  tags = {
    Name = "${var.tags["name"]}-EIP-for-NAT"
  }
}

# NAT Gateway
resource "aws_nat_gateway" "nat_gateway_1" {
  allocation_id = aws_eip.eip_nat_gateway_1.id
  subnet_id     = aws_subnet.public_subnet_1.id

  tags = {
    Name = "${var.tags["name"]}-NAT"
  }
}

