data "aws_ip_ranges" "instante_ec2_europa" {
  regions  = ["us-east-1", "ap-east-1"]
  services = ["ec2"]
}
