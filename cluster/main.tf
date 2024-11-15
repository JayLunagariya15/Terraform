resource "azurerm_kubernetes_cluster" "k8s-cluster" {
  for_each = var.k8s-cluster

  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name
  dns_prefix          = each.value.dns_prefix
  kubernetes_version  = "1.29.9"

  default_node_pool {
    name       = each.value.default_node_pool.name
    node_count = each.value.default_node_pool.node_count
    vm_size    = each.value.default_node_pool.vm_size
  }
  network_profile {
    network_plugin = each.value.network_profile.network_plugin
    network_policy = each.value.network_profile.network_policy
  }
  identity {
    type = each.value.identity.type
  }

}
