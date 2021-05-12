resource "aws_iam_role" "telacad-instance" {
  name = "test_role"

  # Terraform's "jsonencode" function converts a
  # Terraform expression result to valid JSON syntax.
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
    tag-key = "tag-value"
  }
}

resource "aws_iam_policy" "test_policy" {
  name = "test_policy"
  policy = data.template_file.ec2-policy.rendered
}

resource "aws_iam_role_policy_attachment" "test-attach" {
  role       = aws_iam_role.telacad-instance.name
  policy_arn = aws_iam_policy.test_policy.arn
}

resource "aws_iam_instance_profile" "policy-test" {
  name = "test-policy"
  role = aws_iam_role.telacad-instance.name
}

resource "aws_instance" "policy-instance" {
  ami           = var.AMIS[var.AWS_REGION]
  instance_type = "t2.micro"
  iam_instance_profile = aws_iam_instance_profile.policy-test.name

}