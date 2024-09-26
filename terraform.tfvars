Petroleum_rg_details = {
  rg1 = {
    name     = "Petroleum-Hub"
    location = "Mexico Central"
  }
  rg2 = {
    name     = "Petroleum-sub1"
    location = "France Central"
  }
  rg3 = {
    name     = "Petroleum-sub2"
    location = "Korea South"
  }
}

Petroleum_vnet_details = {
  vnet1 = {
    name                = "Petroleum-vnet-Hub"
    location            = "Mexico Central"
    resource_group_name = "Petroleum-Hub"
    address_space       = ["10.0.0.0/16"]
  }
  vnet2 = {
    name                = "Petroleum-vnet-sub1"
    location            = "France Central"
    resource_group_name = "Petroleum-sub1"
    address_space       = ["10.1.0.0/16"]
  }
  vnet3 = {
    name                = "Petroleum-vnet-sub2"
    location            = "Korea South"
    resource_group_name = "Petroleum-sub2"
    address_space       = ["10.2.0.0/16"]
  }
}

Petroleum_snet_details = {
  snet1 = {
    name                 = "Petroleum-snet1"
    resource_group_name  = "Petroleum-Hub"
    virtual_network_name = "Petroleum-vnet-Hub"
    address_prefixes     = ["10.0.1.0/24"]
  }
  snet2 = {
    name                 = "Petroleum-snet2"
    resource_group_name  = "Petroleum-sub1"
    virtual_network_name = "Petroleum-vnet-sub1"
    address_prefixes     = ["10.1.1.0/24"]
  }
  snet3 = {
    name                 = "Petroleum-snet3"
    resource_group_name  = "Petroleum-sub2"
    virtual_network_name = "Petroleum-vnet-sub2"
    address_prefixes     = ["10.1.2.0/24"]
  }
  snet4 = {
    name                 = "AzureBastionSubnet"
    resource_group_name  = "Petroleum-Hub"
    virtual_network_name = "Petroleum-vnet-Hub"
    address_prefixes     = ["10.0.58.0/24"]
  }
  snet5={
    name="AzureFirewallSubnet"
    resource_group_name  = "Petroleum-Hub"
    virtual_network_name = "Petroleum-vnet-Hub"
    address_prefixes     = ["10.0.99.0/24"]
  }
}

Petroleum_nsg_details = {
  nsg1 = {
    name                = "Petroleum-nsg1"
    location            = "Mexico Central"
    resource_group_name = "Petroleum-Hub"
    security_rule = {
      name                       = "Petroleum-securityrule"
      priority                   = 100
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "*"
      source_address_prefix      = "*"
      destination_address_prefix = "*"
    }
    nic_data_name = "Petroleum_nic1"
  }
  nsg2 = {
    name                = "Petroleum-nsg2"
    location            = "France Central"
    resource_group_name = "Petroleum-sub1"
    security_rule = {
      name                       = "Petroleum-securityrule"
      priority                   = 100
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "*"
      source_address_prefix      = "*"
      destination_address_prefix = "*"
    }
    nic_data_name = "Petroleum_nic2"
  }
  nsg3 = {
    name                = "Petroleum-nsg3"
    location            = "Korea South"
    resource_group_name = "Petroleum-sub2"
    security_rule = {
      name                       = "Petroleum-securityrule"
      priority                   = 100
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "*"
      source_address_prefix      = "*"
      destination_address_prefix = "*"
    }
    nic_data_name = "Petroleum_nic3"
  }
}


Petroleum_nic_details = {
  snet1 = {
    nic_name                      = "Petroleum_nic1"
    resource_group_name           = "Petroleum-Hub"
    location                      = "Mexico Central"
    ipconfig_name                 = "Petroleum_ipconfig"
    snet_name                     = "Petroleum-snet1"
    virtual_network_name          = "Petroleum-vnet-Hub"
    private_ip_address_allocation = "Dynamic"
  }
  snet2 = {
    nic_name                      = "Petroleum_nic2"
    resource_group_name           = "Petroleum-sub1"
    location                      = "France Central"
    ipconfig_name                 = "Petroleum_ipconfig"
    snet_name                     = "Petroleum-snet2"
    virtual_network_name          = "Petroleum-vnet-sub1"
    private_ip_address_allocation = "Dynamic"
  }
  snet3 = {
    nic_name                      = "Petroleum_nic3"
    resource_group_name           = "Petroleum-sub2"
    location                      = "Korea South"
    ipconfig_name                 = "Petroleum_ipconfig"
    snet_name                     = "Petroleum-snet3"
    virtual_network_name          = "Petroleum-vnet-sub2"
    private_ip_address_allocation = "Dynamic"
  }

}

Petroleum_bastion_details = {
  bastion1 = { name = "Petroleum-bastion1"
    resource_group_name  = "Petroleum-Hub"
    location             = "Mexico Central"
    ipconfig_name        = "configuration"
    pip_name             = "Petroleum-bastion-pip"
    virtual_network_name = "Petroleum-vnet-Hub"
  }
}

Petroleum_vm_details = {
  snet1 = {
    name                 = "Petroleum-Hub"
    nic_data_name        = "Petroleum_nic1"
    resource_group_name  = "Petroleum-Hub"
    location             = "Mexico Central"
    size                 = "Standard_F2"
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
    publisher            = "Canonical"
    offer                = "0001-com-ubuntu-server-jammy"
    sku                  = "22_04-lts"
    version              = "latest"
    kv_name              = "petroleumkv1"
    secret_name1         = "username"
    secret_name2         = "password"
  }
  snet2 = {
    name                 = "Petroleum-sub1"
    nic_data_name        = "Petroleum_nic2"
    resource_group_name  = "Petroleum-sub1"
    location             = "France Central"
    size                 = "Standard_F2"
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
    publisher            = "Canonical"
    offer                = "0001-com-ubuntu-server-jammy"
    sku                  = "22_04-lts"
    version              = "latest"
    kv_name              = "petroleumkv1"
    secret_name1         = "username"
    secret_name2         = "password"
  }
  snet3 = {
    name                 = "Petroleum-sub2"
    nic_data_name        = "Petroleum_nic3"
    resource_group_name  = "Petroleum-sub2"
    location             = "Korea South"
    size                 = "Standard_F2"
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
    publisher            = "Canonical"
    offer                = "0001-com-ubuntu-server-jammy"
    sku                  = "22_04-lts"
    version              = "latest"
    kv_name              = "petroleumkv1"
    secret_name1         = "username"
    secret_name2         = "password"

  }
}

Petroleum_kv_details = {
  kv1 = {
    name                = "petroleumkv1"
    resource_group_name = "Petroleum-Hub"
    location            = "Mexico Central"
    sku_name            = "standard"
  }
}

Petroleum_secret_details = {
  secret1 = {
    kv_name             = "petroleumkv1"
    secret_name         = "username"
    secret_value        = "Petroleumadmin"
    resource_group_name = "Petroleum-Hub"
  }
  secret2 = {
    kv_name             = "petroleumkv1"
    secret_name         = "password"
    secret_value        = "info@123"
    resource_group_name = "Petroleum-Hub"
  }
}

Petroleum_lb_details = {
  lb1 = {
    name                      = "Petroleum-lb-Hub"
    resource_group_name       = "Petroleum-Hub"
    location                  = "Mexico Central"
    frontend_ipconfig_name    = "PublicIPAddress"
    backend_address_pool_name = "Petroleum-lb1-backendpool1"
    lb_probe_name             = "Petroleum-Health_probe1"
    protocol                  = "Tcp"
    port                      = 80
    interval_in_seconds       = 5
    lb_rule_name              = "Petroleum-lb1-rule1"
    frontend_port             = 9090
    backend_port              = 80
    idle_timeout_in_minutes   = 4
    lb_pip_name               = "Petroleum-lb-pip-Hub"
  }

  lb2 = {
    name                      = "Petroleum-sub1"
    resource_group_name       = "Petroleum-sub1"
    location                  = "France Central"
    frontend_ipconfig_name    = "PublicIPAddress"
    backend_address_pool_name = "Petroleum-lb2-backendpool2"
    lb_probe_name             = "Petroleum-Health_probe2"
    protocol                  = "Tcp"
    port                      = 80
    interval_in_seconds       = 5
    lb_rule_name              = "Petroleum-lb2-rule2"
    frontend_port             = 5050
    backend_port              = 80
    idle_timeout_in_minutes   = 4
    lb_pip_name               = "Petroleum-lb-pip-sub1"
  }
  lb3 = {
    name                      = "Petroleum-sub2"
    resource_group_name       = "Petroleum-sub2"
    location                  = "Korea South"
    frontend_ipconfig_name    = "PublicIPAddress"
    backend_address_pool_name = "Petroleum-lb3-backendpool3"
    lb_probe_name             = "Petroleum-Health_probe3"
    protocol                  = "Tcp"
    port                      = 80
    interval_in_seconds       = 5
    lb_rule_name              = "Petroleum-lb3-rule3"
    frontend_port             = 5050
    backend_port              = 80
    idle_timeout_in_minutes   = 4
    lb_pip_name               = "Petroleum-lb-pip-sub2"
  }
}


Petroleum_lb_nic_details = {
  lb_nic1 = {
    nic_data_name       = "Petroleum_nic1"
    resource_group_name = "Petroleum-Hub"
    ipconfig_name       = "Petroleum_ipconfig"
    backend_pool_key    = "lb1"
  }
  lb_nic2 = {
    nic_data_name       = "Petroleum_nic2"
    resource_group_name = "Petroleum-sub1"
    ipconfig_name       = "Petroleum_ipconfig"
    backend_pool_key    = "lb2"
  }
  lb_nic3 = {
    nic_data_name       = "Petroleum_nic3"
    resource_group_name = "Petroleum-sub2"
    ipconfig_name       = "Petroleum_ipconfig"
    backend_pool_key    = "lb3"
  }
}

Petroleum_peering_details = {
  peering1 = {
    name                        = "Hub-to-sub1"
    resource_group_name         = "Petroleum-Hub"
    virtual_network_name        = "Petroleum-vnet-Hub"
    remote_resource_group_name  = "Petroleum-sub1"
    remote_virtual_network_name = "Petroleum-vnet-sub1"
  }
  peering2 = {
    name                        = "Hub-to-sub2"
    resource_group_name         = "Petroleum-Hub"
    virtual_network_name        = "Petroleum-vnet-Hub"
    remote_resource_group_name  = "Petroleum-sub2"
    remote_virtual_network_name = "Petroleum-vnet-sub2"
  }
}


Petroleum_firewall_details = {
  firewall1={
    pip_name ="firewall-pip"
    location ="Mexico Central"
    resource_group_name= "Petroleum-Hub"
    name="Hub-Firewall"
    policy_name="hub-firewall-policy"
    route_table_name="route-table"
  }
}