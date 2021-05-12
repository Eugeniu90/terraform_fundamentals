# Policy
data "template_file" "ec2-policy" {
  template = file("./policy/ec2-policy.json")
}