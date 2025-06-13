resource "aws_subnet" "main" {
  vpc_id = aws_vpc.main.id
  cidr_block = "10.0.0.0/18"
  availability_zone = "${var.region}a"
  tags = { Name = var.subnet_name}
}