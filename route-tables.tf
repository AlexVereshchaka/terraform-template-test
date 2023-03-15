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

