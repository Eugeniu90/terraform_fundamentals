resource "aws_iam_role" "s3-bucket-rol" {
  name               = "s3-bucket-rol"
  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF

}

resource "aws_iam_instance_profile" "s3-bucket-rol-profil-instanta" {
  name = "s3-bucket-rol"
  role = aws_iam_role.s3-bucket-rol.name
}

resource "aws_iam_role_policy" "s3-bucket-rol-policy" {
  name = "s3-bucket-rol-policy"
  role = aws_iam_role.s3-bucket-rol.id
  policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
              "s3:*"
            ],
            "Resource": [
              "arn:aws:s3:::*"
            ]
        }
    ]
}
EOF

}

