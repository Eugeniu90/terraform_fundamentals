# Capitolul 2.1

Astazi o sa parcurgem cateva exemple de initializare de *plugins* in Terraform.

- [Azure](#azure-plugins)
- [Local](#local-plugins)
- [Null](#null-plugins)
- [OpenStack](#openstack-plugins)
- [Random](#random-plugin)
- [Tema](#tema)


## Azure Plugins
1. Initializare plugins pentru *Azure* astfe, copiem urmatorul continut intr-un fisier nou [azure.tf](azure.tf) cu acest continut:

```terraform
terraform {
  required_providers {
    azurerm = {
      source  = "registry.terraform.io/example/azurerm"
    }
  }
}
```

2. Executam *terraform init* pentru initializarea acestora.

## Local Plugins

1. Initalizam *local* plugins, cream un fisier [local.tf](local.tf) cu urmatorul continut:

```terraform
terraform {
  required_providers {
    local = {
      source  = "registry.terraform.io/example/local"
    }
  }
}
```

2. Executam *terraform init* pentru initializarea acestora.


## Null Plugins

1. Copiem urmatorul continut intr-un fisier nou denumit [null.tf](null.tf):

```terraform
terraform {
  required_providers {
    null = {
      source  = "registry.terraform.io/example/null"
    }
  }
}
```

2. Executam *terraform init* pentru initializarea acestora.

## OpenStack plugins

1. Urmatorul continut il copiem intr-un fisier nou [ostack.tf](openstack.tf):

```terraform
terraform {
  required_providers {

    openstack = {
      source  = "registry.terraform.io/example/openstack"
    }

  }
}
```

2. Executam *terraform init* pentru initializarea acestora.


## Random Plugin

1. Cream fisierul de [random.tf](random.tf) cu urmatorul continut:

```terraform
terraform {
  required_providers {
    random = {
      source  = "registry.terraform.io/example/random"
    }
  }
}
```


2. Executam *terraform init* pentru initializarea acestora.

## Tema:

1. Initializati 3 plugins diferite intr-un singur fisier denumit *tema.tf* si executati initializarea acetora.
2. Primul plugin trebuie sa fie neaparat [Docker](#https://registry.terraform.io/providers/kreuzwerker/docker/latest/docs)
3. Al doilea plugin o sa fie cel de [Kubernetes](#https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs)
4. Ultimul plugin o sa fie unul la alegerea dumneavoastra.
5. La rularea de `terraform init`, toate acestea trebuie sa fie initializate cu succes!
6. Creati un folder nou :

```shell
mkdir ~/.terraform-plugins
```
7. ulterior copiati toate pluginurile descarcate anterior in acest director si rulati din nou terraform cu pluginurile centralizate doar in acel director.

```shell
terraform init --plugins-dir=~/.terraform-plugins
```
