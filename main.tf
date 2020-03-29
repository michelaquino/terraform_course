variable "VPCName" {
    type = "string"
    default = "VPCTerraform"
}


variable "VPCNamesList" {
  type = "list"

  default = ["VPCTerraformList-1", "VPCTerraformList-2"]
}

variable "VPCNamesMap" {
  type = "map"

  default = {
      Name1 = "VPCTerraformMap-1"
      Name2 = "VPCTerraformMap-2"
  }
}

output "VPC-ID" {
  value = "${aws_vpc.myFirstVpc.id}"
}

resource "aws_vpc" "myFirstVpc" {
    cidr_block= "10.0.0.0/16"

    tags = {
        Region = "United-States"

        NameString = "${var.VPCName}"
        NameList = "${var.VPCNamesList[0]}"
        NameMap = "${var.VPCNamesMap.Name1}"
    }
}
  
