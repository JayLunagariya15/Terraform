resource "azurerm_application_gateway" "Petroleum-applicationGateway" {
  for_each            = var.Petroleum_applicationGateway
  name                = each.value.name
  resource_group_name = each.value.resource_group_name
  location            = each.value.location

  sku {
    name     = each.value.sku_name
    tier     = each.value.tier
    capacity = each.value.capacity
  }

  # autoscale_configuration {

  #   min_capacity = each.value.min_capacity
  #   max_capacity = each.value.max_capacity
  # }

  gateway_ip_configuration {
    name      = each.value.gateway_ipconfiguration_name
    subnet_id = data.azurerm_subnet.Petroleum_snet_data[each.key].id
  }

  frontend_ip_configuration {
    name                 = each.value.frontend_ipconfiguration_name
    public_ip_address_id = azurerm_public_ip.Petroleum_applicationGateway_pip[each.key].id
  }

  frontend_port {
    name = each.value.frontend_port_name
    port = each.value.frontend_port
  }

  backend_address_pool {
    name = each.value.backend_address_pool_name
    ip_addresses = [data.azurerm_network_interface.Petroleum_nic_data.private_ip_address]
  }

  backend_http_settings {
    name                  = each.value.backend_http_settings_name
    cookie_based_affinity = each.value.cookie_based_affinity
    # path                  = each.value.path
    port            = each.value.port
    protocol        = each.value.protocol
    request_timeout = each.value.request_timeout
  }

  http_listener {
    name                           = each.value.http_listener_name
    frontend_ip_configuration_name = each.value.frontend_ipconfiguration_name
    frontend_port_name             = each.value.frontend_port_name
    protocol                       = each.value.protocol
  }

  request_routing_rule {
    name                       = each.value.request_routing_rule_name
    rule_type                  = each.value.rule_type
    priority =                  each.value.priority
    http_listener_name         = each.value.http_listener_name
    backend_address_pool_name  = each.value.backend_address_pool_name
    backend_http_settings_name = each.value.backend_http_settings_name
  }
}


resource "azurerm_public_ip" "Petroleum_applicationGateway_pip" {
  for_each            = var.Petroleum_applicationGateway
  name                = each.value.pip_name
  resource_group_name = each.value.resource_group_name
  location            = each.value.location
  allocation_method   = "Static"
  sku                 = "Standard"
}

