#### Bine v-am gasit in acest subcapitol, astazi o sa abordam variabilele si functiile din cadrul Terraform.



- [Variabile](#variabile)
    - [Siruri](#1-siruri)
    - [Dictionare](#2-dictionar--harta-maps)
    - [Liste](#3-liste)
- [Functii](#functii)
- [Tema](#tema)



# Variabile

## 1. Siruri 
1. Intelegerea  Variabilelor in Terraform .
   
    - Cream un fisier denumit [main.tf](main.tf) file.
    - Ulterior apelam o variabila de tipul `string`
```bash
terraform console
> var.curs-digital
```


## 2. Dictionar || harta (maps)
2.1 Cream un fisier denumi [map.tf](map-variablles.tf), cu urmatorul continut:

```bash
variable "curs-map" {
  type = "map"

  default = {
    key       = "value"
    say       = "hello"
    say_again = "world"
  }
}

terraform console:

> var.curs-map
{
  "key" = "value"
  "say" = "hello"
  "say_again" = "world"
}
```

## 3. Liste

3.1 Cream un fisier denumit  [list-variables.tf](list-variables.tf), cu urmatorul continut:

```bash
variable "curs-list"
{
  type        = "list"
  default     = [1,2,3]
}
````

3.2 Dupa ce am creat acest fisier, prin intermediul de Terraform HCL, apelam aceste variabile astfel:
```shell

terraform console
> var.curs-list
[
"1",
"2",
"3",
]
```

## 4. Furnizori

4.1 Creating terraform file with resource examples
```hcl-terraform
provider "aws" {
}

variable "AWS_REGION"{
  type = "string"
}

variable "AMI" {

  type = "map"
  default = {
    eu-west-1 = "ami-01ccc867"
  }
}

resource "aws_instance" "example" {
  ami                   = "var.AMI[var.AWS_REGION}]
  instance_type         = "t2.micro"
}
```

4.1.2 Terraform console access variables:

```hcl-terraform
terraform console
 var.AMI[var.AWS_REGION]
```


# [Functii](#https://www.terraform.io/docs/language/functions/index.html)

Limbajul Terraform include o serie de funcții încorporate pe care le putem apela din expresii pentru a transforma și combina valorile. Sintaxa generală pentru apelurile de funcții este un nume de funcție urmat de argumente separate prin virgule între paranteze:


```shell
> max(5, 20, 9)
20
```


O sa incepem cu cateva functii in acest paragraf:

Denumire Functie| Descriere| Demo
------------ | ------------- | -------------
`basename`(locatie)| Returneaza numele fisierului, ultimul element din director| basename("/home/goncearuce/telacad.txt") *output: `telacad.txt`*
`coalesce`(sir1, sir2...), `coalesce`(list1, list2,...)| Returneaza prima valoada nenula din lista/string |`coalesce`("","","cursant") *output: `cursant`*
`element`(list, index)| Returneaza un element din lista la o pozitie mentionata| `element`(var.curs-list, 1) *output: 2*
`format`(format, argumente) |   Formateaza lista la un formatul de baza|  `format`("Hello, %s!", var.curs-digital) *output: "Hello, Welcome to Terraform Telacad students!!"*
`formatlist`(format, argumente)|Formateaza lista la un formatul de baza|  `formatlist`("Numarul, %s!",var.curs-list)
`index` (lista, element)| Returneaza indexul mentionat in argumente| index(var.curs-list, 1) *output: 0*
`join` (delimitatorul, lista)| Concateneaza lista cu delimitatorul mentionat|  join(",", var.curs-list) *output: 1,2,3*
`list`(element1, element2, ....element N)| Creaza o lista noua| `join`("Cursant Telacad;  ", `list`("Eugeniu: ","Sandu: ","Nadejda: ")) *output: "Eugeniu: Cursant Telacad;  Sandu: Cursant Telacad;  Nadejda: "*
`lookup` (mapa, cheie, [default])| Se realizeaza o cautare in dictionar bazandu-ne pe cheia mentionata| `lookup`(var.curs-map, "say", "Ce ai mentionat?") *output: "hello"*, default: `lookup`(var.curs-map, "test", "Ce ai mentionat??") *output: "Ce ai mentionat?"*
`lower` (sir)| Ne returneaza valoarea minuscula din sir sau a sirului| `lower`("HELLO") *output: "hello"*
`map`(key, value...)| Returneaza un nou dictionar din valorile parsate|  `map`("Nume", "Grigore", "Prenume", "Catana")
`merge`(map1, map2...mapN)| Concateneaza dictionarele| `merge`(var.curs-map, {Nume="Grigore"},  {Prenume="Catana"})
`replace`(sir, cautare, replace)| Executa o cautare si inlocuire pe sir| `replace`(var.curs-digital, " ", "-")


## Tema: 

1. Accesam site-ul oficial de Terraform destinat [functiilor](#https://www.terraform.io/docs/language/functions/index.html) si incercam apelarea functiilor urmatoare:
- min
- abs
- substr
- upper
- trim

2. Le apelam prin intermediul consolei de Terrafom.
NOTE: Pentru a putea sa le apelam, nu uitam sa executam:
   
```shell
terraform init
```

3. Dupa ce le executam din consola si primim raspuns corect, cream un fisier denumit `tema.tf` si definim urmatoarele tipuri de variabile:

- map
- string
- list
- int

4. Dupa definirea acestora, le v-om apela prin intermediul functiilor de la punctele anterioare.