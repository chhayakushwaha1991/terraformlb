ami_id            = "ami-017fecd1353bcc96e"
instance_type_ami = "t3.micro"
map_ip            = true
my_port           = ["443", "80", "22", "8080"]
availability_zone_names = ["us-west-2a", "us-west-2b"]
subnet_cidr = ["10.1.0.0/19", "10.1.32.0/19"]
# asg = ["asg1", "asg2", "asg3"]
# tglb =tg1", "tg2" ] [ "