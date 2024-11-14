rg-module = {
  rg1 = {
    resource_group_name = "Jay-RG"
    location            = "France Central"
  }
}

cluster-module = {
  cluster1 = {
    name                = "TF-aks"
    location            = "France Central"
    resource_group_name = "Jay-RG"
    dns_prefix          = "aks"
    default_node_pool = {
      name       = "qwerty"
      node_count = 2
      vm_size    = "Standard_DS2_v2"
    }
    network_profile = {
      network_plugin = "azure"
      network_policy = "calico"
    }
    identity = {
      type = "SystemAssigned"
    }
  }
}
