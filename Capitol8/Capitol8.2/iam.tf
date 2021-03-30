# Definim grupul nostru
resource "aws_iam_group" "cursanti" {
  name = "cursanti"
}

resource "aws_iam_policy_attachment" "cursanti-attach" {
  name       = "cursanti-attach"
  groups     = [aws_iam_group.cursanti.name]
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
}

# utilizatorii
resource "aws_iam_user" "cursant1" {
  name = "cursant1"
}

resource "aws_iam_user" "cursant2" {
  name = "cursant2"
}

resource "aws_iam_group_membership" "cursanti-users" {
  name = "cursanti-users"
  users = [
    aws_iam_user.cursant1.name,
    aws_iam_user.cursant2.name,
  ]
  group = aws_iam_group.cursanti.name
}

output "atentie" {
  value = "ATENTIE: De asigurat ca utilizam AdministratorAccess policy doar pentru creare/definire de utilizatori/roluri/grupuri etc. La final rulam terraform destroy!"
}

