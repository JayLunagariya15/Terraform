

# data "azurerm_public_ip" "Petroleum_pip_data" {
#   for_each = var.Petroleum-nics-pip-data
#   name                = each.value.name
#   resource_group_name = each.value.resource_group_name
# }
