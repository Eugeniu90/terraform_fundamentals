## Capitolul 2.2

- [Furnizori](#1-furnizorii)
- [Amazon Machine Image](#2-ami)
- [Versiune](#3-versiune)
- [Fisierul de variabile generice](#4-fisierul-de-variabile-generice-tfvars)
- [Fisierul de variabile globale](#5-fisierul-de-variabile-globale)
- [Prima noastra instanta provizionata](#6-prima-instanta-in-aws)
- [Provizionarea](#executare)
- [Teme](#tema)

## 1. Furnizorii
Cream un  fisier de variabile denumit [providers.tf](provider.tf) cu acest continut:
```terraform
provider "aws" {
  access_key = var.AWS_ACCESS_KEY
  secret_key = var.AWS_SECRET_KEY
  region     = var.AWS_REGION
}
```

- 1.1 *AWS_ACCESS_KEY* : Acest paramentru este responsabil de cheia generata din consola de AWS.
- 1.2 *AWS_SECRET_KEY*:  Parametrul respectiv este secretul asociat cheiei de mai sus.
- 1.3 *AWS_REGION* : Specificam la acest paramentru regiunea din cadrul AWS pe care o sa utilizam la provizionare.


## 2. AMI 
Cream un fisier de AMI [ami.tf](ami.tf) (Amazon - machine - images) cu urmatorul continut:

```terraform
variable "AMIS" {
  type = "map"
  default = {
    us-east-1 = "ami-13be557e"
    us-west-2 = "ami-06b94666"
    eu-west-1 = "ami-0d729a60"
  }
}
```
Acest fisier este responsabil de imaginile din cadrul AWS Marketplace asociate zonelor respective.

## 3. Versiune

1. Cream un fisier denumit [versions.tf](versions.tf) in care specificam ca utilizam o versiune superoada pentru *0.11* de Terraform.

#### NOTE: Sintaxa difera de la 0.11  la 0.13 in sus.

2. Fisierul denumit *versions.tf* :
```terraform
terraform {
  required_version = ">= 0.12"
}
```

## 4. Fisierul de variabile generice *.tfvars

1. Cream un fisier numit [terraform.tfvars](terraform.tfvars) care contine variabilele generice asociate variabilelor globale.

2. Fisierul *terraform.tfvars* cu acest continut:

```terraform
AWS_ACCESS_KEY="{{CHEIA_AWS}}"
AWS_SECRET_KEY="{{SECRET_AWS}}"
```
Aceste credentiale pot fi extrase din consola de AWS. O sa parcurgem pasul respectiv in zona video al acestui curs.

## 5. Fisierul de variabile globale

1. Cream un fisier [vars.tf](vars.tf) cu urmatorul continut:

```terraform
variable "AWS_ACCESS_KEY" {
}

variable "AWS_SECRET_KEY" {
}

variable "AWS_REGION" {
  default = "eu-west-1"
}
```


2. Acest fisier din cate vedeti are 2 variabile nedefinite care o sa fie apelate in timpul executiei din fisierul de *terraform.tfvars*.

## 6. Prima instanta in AWS

1. O sa provisionam o insanta de EC2 in AWS astfel:
   
    - Cream un fisier denumit [instance.tf](instance.tf).
    - Adaugam urmatorul continut:
    
```terraform
resource "aws_instance" "example" {
  ami           = var.AMIS[var.AWS_REGION]
  instance_type = "t2.micro"
}
```

2. Din cate vedem, in acest fisier, facem referire la variabila de `AMIS` care ne invoca `AWS_REGIONS`.


## Executare

1. Rulam  urmatoarea instructiune pentru a initializa Terraform:

```shell
terraform init
```

2. Rulam planificarea resurselor pentru a vedea ce resurse o sa fie create in viitor de catre noi astfel:

```shell
terraform plan
```

3. Provizionam instanta automat in AWS:
```shell
terraform apply
```

4. Dupa ce provizionam si vedem masina, putem sterge resursele create astfel:

```shell
terraform destroy
```



## Tema

1. Cream o masina de tipul *t3.small* in AWS.
2. Rulam planificarea acestuia pentru a vedea cum o sa arate instanta in state.
3. Accesam AWS sa vedem ca intr-adevar exista in consola.
4. Distrugem instanta creata, tot prin Terraform.

