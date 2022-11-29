resource "aws_vpc" "my_vpc" {
  cidr_block = "10.1.0.0/18"

  tags = {
    Name = "tf-example"
  }
}

resource "aws_subnet" "publicsubnet" {
  vpc_id                  = aws_vpc.my_vpc.id
  cidr_block              = var.subnet_cidr[0]
  availability_zone       = var.availability_zone_names[0]
  map_public_ip_on_launch = var.map_ip

  tags = {
    Name = "tf-example"
  }
}

resource "aws_subnet" "privatesubnet" {
  vpc_id            = aws_vpc.my_vpc.id
  cidr_block        = var.subnet_cidr[1]
  availability_zone       = var.availability_zone_names[1]
  map_public_ip_on_launch = var.map_ip
  tags = {
    Name = "tf-example1"
  }
}

resource "aws_network_interface" "nwif" {
  subnet_id   = aws_subnet.publicsubnet.id
  private_ips = ["10.1.0.6"]

  tags = {
    Name = "primary_network_interface"
  }
}


resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.my_vpc.id

  tags = {
    Name = "main"
  }
}

# resource "aws_default_route_table" "example" {
#   default_route_table_id = aws_vpc.my_vpc.default_route_table_id

#   route {
#     cidr_block = "0.0.0.0/0"
#     gateway_id = aws_internet_gateway.igw.id
#   }
# }
resource "aws_route_table" "publicrt" {
  vpc_id = aws_vpc.my_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
}

resource "aws_route_table_association" "publixrt_association" {
  subnet_id      = aws_subnet.publicsubnet.id
  route_table_id = aws_route_table.publicrt.id
}


resource "aws_network_interface_sg_attachment" "sg_attachment" {
  security_group_id    = aws_security_group.sg.id
  network_interface_id = aws_network_interface.nwif.id
}