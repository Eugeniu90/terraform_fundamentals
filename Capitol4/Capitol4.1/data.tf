data "aws_ip_ranges" "instante_ec2_europa" {
  regions  = ["eu-west-1", "eu-central-1"]
  services = ["ec2"]
}