resource "aws_security_group" "server_sg" {
		name = "server_sg"
		description = "security group for rhel"
		vpc_id = "vpc-4214de29"
		ingress {
                        description = "ssh"
                        from_port = 22
                        to_port = 22
                        protocol = "tcp"
                        cidr_blocks = ["0.0.0.0/0"]
                }
		ingress {
			description = "http"
			from_port = 80
			to_port = 80
			protocol = "tcp"
			cidr_blocks = ["0.0.0.0/0"]
		}	
		ingress {
                        description = "https"
                        from_port = 443
                        to_port = 443
                        protocol = "tcp"
                        cidr_blocks = ["0.0.0.0/0"]
                }
		egress {
                        from_port = 0
                        to_port = 0
                        protocol = "-1"
                        cidr_blocks = ["0.0.0.0/0"]
                }
		tags = {
			Name = "server_sg"
		}
	
}
