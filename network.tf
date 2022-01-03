# reserve Elastic IP to be used in our NAT gateway
resource "aws_eip" "nat_gw_elastic_ip" {
    vpc = true

    tags = {
        Name = "${var.cluster_name}-nat-eip"
        iac_environment = var.iac_environment_tag
    }
}

