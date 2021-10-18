provider "aws" {

	region = "us-east-2"

}



resource "aws_security_group" "jenkin_sg" {

	name = "jenkin_sg"
	description = "allwo ports for jenkins access"

	ingress  {
	from_port   = 22
	to_port     = 22
	protocol    = "tcp"
	cidr_blocks = ["0.0.0.0/0"]
	 }

ingress  {
	from_port   = 80
	to_port     = 80
	protocol    = "tcp"
	cidr_blocks = ["0.0.0.0/0"]
	 }

	ingress  {
	from_port   = 443
	to_port     = 443
	protocol    = "tcp"
	cidr_blocks = ["0.0.0.0/0"]
	 }
	ingress  {
	from_port   = 8080
	to_port     = 8080
	protocol    = "tcp"
	cidr_blocks = ["0.0.0.0/0"]
	 }


	egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  
}

  resource "aws_instance" "ec2_jenkins" {

	ami 		    = "ami-074cce78125f09d61"
	instance_type   = "t2.micro"
	security_groups = [aws_security_group.jenkin_sg.name]
	key_name        = "ec2_aws_jenkins"
	user_data       = "${file("install_jenkins.sh")}"

		tags = { 
	"NAME"= "ec2-terraform_jenkins"
		}

}
