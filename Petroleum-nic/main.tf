resource "azurerm_network_interface" "Petroleum_nic" {
  for_each = var.Petroleum-nics
  name                = each.value.name
  resource_group_name = each.value.resource_group_name
  location            = each.value.location
  ip_configuration {
    name                          = each.value.ip_configuration.name
    private_ip_address_allocation = each.value.ip_configuration.private_ip_address_allocation
    public_ip_address_id          = each.value.ip_configuration.public_ip_address_id
    subnet_id                     = each.value.ip_configuration.subnet_id
  }
}