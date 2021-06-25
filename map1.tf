provider "aws" {
  region     = "ap-south-1"
}

variable "vpcnet" {
    default = { 
        "net-one": "10.0.0.0/16", 
        "net-two": "10.2.0.0/16"
    }
  
}

resource "aws_vpc" "AwsVpc" {
    for_each = var.vpcnet
    cidr_block = each.value
    tags = {
      "Name" = each.key
    }  
}
