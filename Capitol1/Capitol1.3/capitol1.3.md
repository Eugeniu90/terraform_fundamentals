# Capitol 1.3

In acest subcapitol o sa invocam cativa furnizori de TOP.


[AWS](#1-furnizorul-aws)
[Tema](#tema)

## 1. Furnizorul AWS

1. Cream un  fisier denumit [provider.tf](provider.tf), cu urmatorul continut:

```terraform
provider "aws" {
}
```

2. Pentru a face initializarea cu acest furnizor, rulam urmatoarea instructiune:

```bash
terraform init

Initializing the backend...

Initializing provider plugins...
- Finding latest version of hashicorp/aws...
- Installing hashicorp/aws v3.33.0...
- Installed hashicorp/aws v3.33.0 (signed by HashiCorp)

Terraform has created a lock file .terraform.lock.hcl to record the provider
selections it made above. Include this file in your version control repository
so that Terraform can guarantee to make the same selections by default when
you run "terraform init" in the future.

Terraform has been successfully initialized!

You may now begin working with Terraform. Try running "terraform plan" to see
any changes that are required for your infrastructure. All Terraform commands
should now work.

If you ever set or change modules or backend configuration for Terraform,
rerun this command to reinitialize your working directory. If you forget, other
commands will detect it and remind you to do so if necessary.
```

3. Felicitari, acum am initializat Terraform cu furnizorul de AWS.

##Tema: 

1. Incercam sa initializam Terraform cu furnizorul de la Microsoft [Azure](#https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs)
2. Initializam Terraform cu furnizorul [Google Cloud](#https://registry.terraform.io/providers/hashicorp/google/latest/docs).
3. Initializam Terraform cu furnizorul [Alibaba](#https://registry.terraform.io/providers/aliyun/alicloud/latest/docs).
