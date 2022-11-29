resource "aws_launch_configuration" "lconf" {
  name_prefix   = "my_lconf"
  image_id      = var.ami_id
  instance_type = var.instance_type_ami
   user_data =  filebase64("userdata.sh")
    key_name = "chhaya1"
    security_groups        = ["${aws_security_group.sg.id}"]

   # user_data_replace_on_change = {user_data= filebase64("userdata.sh")}

  lifecycle {
    create_before_destroy = true
    ignore_changes = [user_data]
  }

   
}

resource "aws_launch_configuration" "lconf1" {
  name_prefix   = "my_lconf"
  image_id      = var.ami_id
  instance_type = var.instance_type_ami
   user_data =  filebase64("userdata1.sh")
    key_name = "chhaya1"
    security_groups        = ["${aws_security_group.sg.id}"]

   # user_data_replace_on_change = {user_data= filebase64("userdata.sh")}

  lifecycle {
    create_before_destroy = true
    ignore_changes = [user_data]
  }

   
}