locals {
  parametri = {
    Cursant        = "Gigel"
    Nota           = "10"
    Profesor       = "Eugeniu.g"
  }
}

module "parametri" {
  for_each   = local.parametri
  source     = "./demo_module"
  nume       = each.key
  valoare    = each.value
}

output "all-my-parameters" {
  value = { for k, parameter in module.parametri: k => parameter.arn }
}
