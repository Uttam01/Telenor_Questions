provider "aws" {
	profile	= "sample"
	region	= "ap-south-1"
}
resource "aws_instance" "rhel_server"{
	ami	= "ami-00d05da9ad5c69bfd"
	instance_type = "t2.micro"
	key_name = "LinuxMachine"
	subnet_id = "subnet-5cea1937"
	vpc_security_group_ids = [aws_security_group.server_sg.id]
	associate_public_ip_address = true
	iam_instance_profile = aws_iam_instance_profile.ec2_profile.name
	user_data = file("user_data.sh")
	ebs_block_device{
		volume_size = 5
00		volume_type = "gp2"
		device_name = "/dev/sdb" 
	}
	tags = {
		Name = "Linuxssm"
	}
}
