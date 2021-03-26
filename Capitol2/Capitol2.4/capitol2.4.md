## Recapitulare

In acest capitol am trecut prin variabile, plugins, functii si chiar am provizionat o instanta in AWS, Felicitari dragilor!

## Iterarea prin variabile:

Incepand cu `terraform > 0.12`, putem utiliza `for` si `for_each` iteratii prin variabile astfel:

### for
```terraform
> [for sir in ["buna", "ziua", "dragi", "cursanti"]: upper(sir)]

Output:
        
[
"BUNA",
"ZIUA",
"DRAGI",
"CURSANTI",
]
```

### for_each

Meta-argumentul `for_each` acceptă o hartă sau un set de șiruri și creează o instanță pentru fiecare element din harta sau setul respectiv. 

Fiecare instanță are un obiect de infrastructură distinct asociat și fiecare este creat separat, actualizat sau distrus când se aplică configurația.

In exemplul de mai jos , iteram prin seturi de siruri definita utilizand `for_each`.


```terraform
resource "aws_iam_user" "the-accounts" {
  for_each = toset( ["Eugeniu", "Florentina", "Alina", "Victor"] )
  name     = each.key
}
```

Iterarea se mai poate face si prin alte tipuri de date cum ar fi `maps`:

```terraform
resource "azurerm_resource_group" "telacad_resursa" {
  for_each = {
    a_group = "eu-west1"
    another_group = "eu-east1"
  }
  name     = each.key
  location = each.value
}
```

## Tema:

0. Cream folderul de `recapitulare`

1. Definim urmatoarele tipuri de variabile in fisierul *recapitulare.tf*:

 - lista
 - sir
 - mapa
 - int

2. Nu uitam sa cream fisierul de *providers.tf*

3. Apelam aceste variabile prin Terraform HCL.

4. Executam aceste variabile prin intermediul funciilor definite la subcapitolul anterior.




