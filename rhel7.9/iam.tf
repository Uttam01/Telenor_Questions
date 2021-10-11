resource "aws_iam_instance_profile" "ec2_profile"{
	name = "rhel_role"
	role = aws_iam_role.ec2_role.name	
}
resource "aws_iam_role" "ec2_role"{
	name = "ec2_role"
	assume_role_policy = jsonencode({
    	Version = "2012-10-17"
    	Statement = [
      	{
        	Action = "sts:AssumeRole"
        	Effect = "Allow"
        	Sid    = ""
        	Principal = {
          	Service = "ec2.amazonaws.com"
        }
      },
    ]
  })

  tags = {
    	Name = "ec2_role"
  }
}
resource "aws_iam_policy" "ec2_policy"{
	name = "ec2_policy"
	policy = file("ec2_policy.json")
}
resource "aws_iam_role_policy_attachment" "ec2_policy_attach"{
	role = aws_iam_role.ec2_role.name
	policy_arn = aws_iam_policy.ec2_policy.arn
} 
