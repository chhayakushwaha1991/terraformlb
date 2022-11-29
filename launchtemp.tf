# resource "aws_launch_template" "foo" {
#   name = "foo"

#   block_device_mappings {
#     device_name = "/dev/sda1"

#     ebs {
#       volume_size = 20
#     }
#   }
#   image_id = var.ami_id
#    instance_type = var.instance_type_ami
#    user_data = filebase64("userdata.sh")
#     key_name = "chhaya1"
#   #   network_interfaces {
#   #   network_interface_id = aws_network_interface.nwif.id
#   #   device_index         = 0
#   # }
#   vpc_security_group_ids = ["sg-0b9a3272ed8817790"]
# }