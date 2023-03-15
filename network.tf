resource "aws_vpc" "my_vpc" {
  cidr_block = "10.0.0.0/16"
}

resource "aws_subnet" "subnet_1" {
  vpc_id     = aws_vpc.my_vpc.id
  cidr_block = "10.0.1.0/24"
}

resource "aws_subnet" "subnet_2" {
  vpc_id     = aws_vpc.my_vpc.id
  cidr_block = "10.0.2.0/24"
}

resource "aws_route_table" "my_route_table" {
  vpc_id = aws_vpc.my_vpc.id

route {
  cidr_block = aws_subnet.subnet_2.cidr_block
  gateway_id = aws_internet_gateway.my_internet_gateway.id
}
}

resource "aws_subnet_route_table_association" "subnet_1_association" {
  subnet_id = aws_subnet.subnet_1.id
  route_table_id = aws_route_table.my_route_table.id
}

resource "aws_subnet_route_table_association" "subnet_2_association" {
  subnet_id = aws_subnet.subnet_2.id
  route_table_id = aws_route_table.my_route_table.id
}

resource "aws_internet_gateway" "my_internet_gateway" {
  vpc_id = aws_vpc.my_vpc.id
}

resource "aws_nat_gateway" "my_nat_gateway" {
  allocation_id = aws_eip.my_eip.id
  subnet_id = aws_subnet.subnet_1.id
}

resource "aws_eip" "my_eip" {
  vpc = true
}

resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.my_vpc.id

    route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.my_internet_gateway.id
    }
}

resource "aws_route_table_association" "public_route_table_association" {
  subnet_id = aws_subnet.subnet_1.id
  route_table_id = aws_route_table.public_route_table.id
}