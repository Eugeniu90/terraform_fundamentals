## Capitol 7.1

- [State list](#1-state-list)
- [State pull](#2-state-pull)
- [State show](#3-list-show)
- [State Move](#4-move-state)
- [State Remove](#5-remove-state)
- [State Import](#6-import-state)


In acest subcapitol o sa parcurgem Terraform `Local State` prin manipulari de `state`.

### 1. State list

```shell
terraform state list
```

### 2. State pull

```shell
terraform state pull
```

### 3. List show

```shell
terraform state list  aws_ssm_parameter.parametru_demo
terraform state show  aws_ssm_parameter.parametru_demo
```

### 4. Move state

```shell
terraform state mv  show aws_ssm_parameter.parametru_demo  aws_ssm_parameter.parametru_demo2
```

### 5. Remove state

```shell
terraform state rm  show aws_ssm_parameter.parametru_demo
```

### 6. Import state

```shell
terraform import  show aws_ssm_parameter.parametru_demo /telacad/cursant
```