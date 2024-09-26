resource "azurerm_public_ip" "Petroleum_firewall_pip" {
  for_each            = var.Petroleum_firewall
  name                = each.value.pip_name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name
  allocation_method   = "Static"
  sku                 = "Standard"
}

resource "azurerm_firewall" "Petroleum_firewall" {
  for_each            = var.Petroleum_firewall
  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name
  sku_name            = "AZFW_VNet"
  sku_tier            = "Standard"
  firewall_policy_id  = azurerm_firewall_policy.Petroleum_firewall_policy[each.key].id
  ip_configuration {
    name                 = "configuration"
    subnet_id            = data.azurerm_subnet.Petroleum_firewall_snet_data[each.key].id
    public_ip_address_id = azurerm_public_ip.Petroleum_firewall_pip[each.key].id
  }
}

resource "azurerm_firewall_policy" "Petroleum_firewall_policy" {
  for_each                 = var.Petroleum_firewall
  name                     = each.value.policy_name
  resource_group_name      = each.value.resource_group_name
  location                 = each.value.location
  sku                      = "Premium"
  threat_intelligence_mode = "Alert"
}

resource "azurerm_route_table" "Petroleum_firewall_route_table" {
  for_each            = var.Petroleum_firewall
  name                = each.value.route_table_name
  resource_group_name = each.value.resource_group_name
  location            = each.value.location

  route {
    name                   = "route1"
    address_prefix         = "0.0.0.0/0"
    next_hop_type          = "VirtualAppliance"
  }

}

resource "azurerm_firewall_network_rule_collection" "Petroleum_firewall_network_rule_collection" {
  for_each            = var.Petroleum_firewall
  name                = each.value.network_rule_collection_name
  azure_firewall_name = azurerm_firewall.Petroleum_firewall[each.key].name
  resource_group_name = each.value.resource_group_name
  priority            = 100
  action              = "Allow"
  rule {
    name = "allow-ssh"
    protocols = [
      "TCP",
      "UDP"
    ]
    source_addresses = [
      "*"
    ]
    destination_ports = [
      "22",
      "80",
    ]
    destination_addresses = [
      "*"
    ]
  }
}


resource "azurerm_subnet_route_table_association" "Petroleum_firewall_subnet_route_table_association" {
  subnet_id      = azurerm_subnet.backend_subnet.id
  route_table_id = azurerm_route_table.Petroleum_firewall_route_table[each.key].id
}


resource "azurerm_firewall_policy_rule_collection_group" "Petroleum_firewall_policy_rule_collection_group" {
  for_each           = var.Petroleum_firewall
  name               = each.value.policy_rule_collection_group_name
  firewall_policy_id = azurerm_firewall_policy.Petroleum_firewall_policy[each.key].id
  priority           = 100
  network_rule_collection {
    name     = each.value.network_rule_collection_name
    priority = 100
    action   = "Allow"
    rule {
      name = "allow-ssh"
      protocols = [
        "TCP",
        "UDP"
      ]
      source_addresses = [
        "*"
      ]
      destination_ports = [
        "22",
        "80",
      ]
      destination_addresses = [
        "*"
      ]
    }
  }

}
