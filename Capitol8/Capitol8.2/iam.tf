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
  name = "Eugeniu"
}

resource "aws_iam_user" "cursant2" {
  name = "Gigel"
}

resource "aws_iam_user" "cursant3" {
  name = "Nicu"
}

resource "aws_iam_user" "cursant4" {
  name = "Petrut"
}

resource "aws_iam_user" "cursant5" {
  name = "Vadima"
}

resource "aws_iam_user" "cursant6" {
  name = "Nadejda"
}

resource "aws_iam_group_membership" "cursanti-users" {
  name = "cursanti-users"
  users = [
    aws_iam_user.cursant1.name,
    aws_iam_user.cursant2.name,
    aws_iam_user.cursant3.name,
    aws_iam_user.cursant4.name,
    aws_iam_user.cursant5.name,
    aws_iam_user.cursant6.name,
  ]
  group = aws_iam_group.cursanti.name
}

output "atentie" {
  value = "ATENTIE: De asigurat ca utilizam AdministratorAccess policy doar pentru creare/definire de utilizatori/roluri/grupuri etc. La final rulam terraform destroy!"
}

