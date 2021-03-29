# Policy
data "template_file" "sqs-policy" {
  template = file("./policy/ec2-policy.json")
}