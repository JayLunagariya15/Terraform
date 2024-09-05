resource "azurerm_lb" "Petroleum_lb" {
  for_each            = var.Petroleum_lb
  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name
  sku                 = "Standard"

  frontend_ip_configuration {
    name                 = each.value.frontend_ipconfig_name
    public_ip_address_id = azurerm_public_ip.Petroleum_lb_pip[each.key].id
  }
}

resource "azurerm_lb_backend_address_pool" "Petroleum_lb_backend_address_pool" {
  for_each        = var.Petroleum_lb
  name            = each.value.backend_address_pool_name
  loadbalancer_id = azurerm_lb.Petroleum_lb[each.key].id
}

resource "azurerm_lb_probe" "Petroleum_lb_probe" {
  for_each            = var.Petroleum_lb
  name                = each.value.lb_probe_name
  loadbalancer_id     = azurerm_lb.Petroleum_lb[each.key].id
  protocol            = each.value.protocol
  port                = each.value.port
  interval_in_seconds = each.value.interval_in_seconds
}

resource "azurerm_lb_rule" "Petroleum_lb_rule" {
  for_each                       = var.Petroleum_lb
  name                           = each.value.lb_rule_name
  loadbalancer_id                = azurerm_lb.Petroleum_lb[each.key].id
  protocol                       = each.value.protocol
  frontend_port                  = each.value.frontend_port
  backend_port                   = each.value.backend_port
  frontend_ip_configuration_name = each.value.frontend_ipconfig_name
  backend_address_pool_ids       = [azurerm_lb_backend_address_pool.Petroleum_lb_backend_address_pool[each.key].id]
  probe_id                       = azurerm_lb_probe.Petroleum_lb_probe[each.key].id
  idle_timeout_in_minutes        = each.value.idle_timeout_in_minutes
}

resource "azurerm_public_ip" "Petroleum_lb_pip" {
  for_each            = var.Petroleum_lb
  name                = each.value.lb_pip_name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name
  allocation_method   = "Static"
  sku                 = "Standard"
}
