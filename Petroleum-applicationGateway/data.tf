data "azurerm_subnet" "Petroleum_snet_data" {
    for_each             = var.Petroleum_applicationGateway
    name                 = each.value.snet_name
    resource_group_name  = each.value.resource_group_name
    virtual_network_name = each.value.virtual_network_name
}

data "azurerm_network_interface" "Petroleum_nic_data" {
  name                ="Petroleum_nic1"
  resource_group_name = "Frontend-RG"
}   