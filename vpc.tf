resource  "aws_vpc" "jenkins_cicd" {
  
cidr_block       = "10.0.0.0/16"
instance_tenancy = "default"

tags = {

    Name = "demo-vpc"

}

}