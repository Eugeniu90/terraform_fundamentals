# Capitol 1.2

In acest subcapitol o sa exersam anumite abordari si executari destinate *Terraform HCL*

- [Utilizarea comenzilor HCL in Terraform](#1-utilizarea-comenzilor-hcl-in-terraform)
- [Utilizarea limbajului HCL pentru apelarea unei variabile pe baza unei chei](#2-utilizarea-limbajului-hcl-pentru-apelarea-unei-variabile-pe-baza-unei-chei)
- [Tema](#3-tema)


## 1. Utilizarea comenzilor HCL in Terraform.

- Cream un fisier denumit: *main.tf* .
- Ulterior incercam sa apelam anumite variabile:

```bash
terraform console
> var.terraform-course"
```

## 2. Utilizarea limbajului HCL pentru apelarea unei variabile pe baza unei chei:

```bash
variable "wpdgs-map" {
  type = "map"

  default = {
    key       = "value"
    say       = "hello"
    say_again = "world"
  }
}

terraform console:

> var.telacad-map["say"]
{
  "key" = "value"
  "say" = "hello"
  "say_again" = "world"
}
```

## 3. Tema:

 - Cream un fisier *exercitii.tf*
 - Incercam sa definim o variabila dupa exemplele de mai sus si sa apelam valorile asociate acestora.

