Petroleum_rg_details = {
  rg1 = {
    name     = "Frontend-RG"
    location = "Mexico Central"
  }
  rg2 = {
    name     = "Backend-RG"
    location = "France Central"
  }
}

Petroleum_vnet_details = {
  vnet1 = {
    name                = "Frontend-vnet"
    location            = "Mexico Central"
    resource_group_name = "Frontend-RG"
    address_space       = ["10.0.0.0/16"]
  }
  vnet2 = {
    name                = "Backend-vnet"
    location            = "France Central"
    resource_group_name = "Backend-RG"
    address_space       = ["10.1.0.0/16"]
  }
}

Petroleum_snet_details = {
  snet1 = {
    name                 = "Petroleum-snet1"
    resource_group_name  = "Frontend-RG"
    virtual_network_name = "Frontend-vnet"
    address_prefixes     = ["10.0.1.0/24"]
  }
  snet2 = {
    name                 = "Petroleum-snet2"
    resource_group_name  = "Frontend-RG"
    virtual_network_name = "Frontend-vnet"
    address_prefixes     = ["10.0.29.0/24"]
  }
  snet3 = {
    name                 = "Petroleum-snet3"
    resource_group_name  = "Backend-RG"
    virtual_network_name = "Backend-vnet"
    address_prefixes     = ["10.1.1.0/24"]
  }
  snet4 = {
    name                 = "Petroleum-snet4"
    resource_group_name  = "Backend-RG"
    virtual_network_name = "Backend-vnet"
    address_prefixes     = ["10.1.2.0/24"]
  }
  snet5 = {
    name                 = "AzureBastionSubnet"
    resource_group_name  = "Frontend-RG"
    virtual_network_name = "Frontend-vnet"
    address_prefixes     = ["10.0.58.0/24"]
  }
  snet6 = {
    name                 = "AzureBastionSubnet"
    resource_group_name  = "Backend-RG"
    virtual_network_name = "Backend-vnet"
    address_prefixes     = ["10.1.3.0/24"]
  }

  snet7 = {
    name                 = "AzureApplicationGateway"
    resource_group_name  = "Frontend-RG"
    virtual_network_name = "Frontend-vnet"
    address_prefixes     = ["10.0.98.0/24"]

  }
}

Petroleum_nsg_details = {
  nsg1 = {
    name                = "Petroleum-nsg1"
    location            = "Mexico Central"
    resource_group_name = "Frontend-RG"
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
    location            = "Mexico Central"
    resource_group_name = "Frontend-RG"
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
    location            = "France Central"
    resource_group_name = "Backend-RG"
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
  nsg4 = {
    name                = "Petroleum-nsg4"
    location            = "France Central"
    resource_group_name = "Backend-RG"
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
    nic_data_name = "Petroleum_nic4"
  }
}

Petroleum_nic_details = {
  snet1 = {
    nic_name                      = "Petroleum_nic1"
    resource_group_name           = "Frontend-RG"
    location                      = "Mexico Central"
    ipconfig_name                 = "Petroleum_ipconfig"
    snet_name                     = "Petroleum-snet1"
    virtual_network_name          = "Frontend-vnet"
    private_ip_address_allocation = "Dynamic"
  }
  snet2 = {
    nic_name                      = "Petroleum_nic2"
    resource_group_name           = "Frontend-RG"
    location                      = "Mexico Central"
    ipconfig_name                 = "Petroleum_ipconfig"
    snet_name                     = "Petroleum-snet2"
    virtual_network_name          = "Frontend-vnet"
    private_ip_address_allocation = "Dynamic"
  }
  snet3 = {
    nic_name                      = "Petroleum_nic3"
    resource_group_name           = "Backend-RG"
    location                      = "France Central"
    ipconfig_name                 = "Petroleum_ipconfig"
    snet_name                     = "Petroleum-snet3"
    virtual_network_name          = "Backend-vnet"
    private_ip_address_allocation = "Dynamic"
  }
  snet4 = {
    nic_name                      = "Petroleum_nic4"
    resource_group_name           = "Backend-RG"
    location                      = "France Central"
    ipconfig_name                 = "Petroleum_ipconfig"
    snet_name                     = "Petroleum-snet4"
    virtual_network_name          = "Backend-vnet"
    private_ip_address_allocation = "Dynamic"
  }

}

Petroleum_bastion_details = {
  bastion1 = { name = "Petroleum-bastion1"
    resource_group_name  = "Frontend-RG"
    location             = "Mexico Central"
    ipconfig_name        = "configuration"
    pip_name             = "Petroleum-bastion-pip"
    virtual_network_name = "Frontend-vnet"
  }
  bastion2 = { name = "Petroleum-bastion2"
    resource_group_name  = "Backend-RG"
    location             = "France Central"
    ipconfig_name        = "configuration"
    pip_name             = "Petroleum-bastion-pip2"
    virtual_network_name = "Backend-vnet"
  }
}

Petroleum_vm_details = {
  snet1 = {
    # snet1                = "Petroleum-snet1"
    name                 = "Frontend-vm1"
    nic_data_name        = "Petroleum_nic1"
    resource_group_name  = "Frontend-RG"
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
    # snet2                = "Petroleum-snet2"
    name                 = "Frontend-vm2"
    nic_data_name        = "Petroleum_nic2"
    resource_group_name  = "Frontend-RG"
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
  snet3 = {
    # snet3                = "Petroleum-snet3"
    name                 = "Backend-vm1"
    nic_data_name        = "Petroleum_nic3"
    resource_group_name  = "Backend-RG"
    location             = "France Central"
    size                 = "Standard_F2"
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
    publisher            = "Canonical"
    offer                = "0001-com-ubuntu-server-jammy"
    sku                  = "22_04-lts"
    version              = "latest"
    kv_name              = "petroleumkv2"
    secret_name1         = "username"
    secret_name2         = "password"

  }
  snet4 = {
    # snet4                = "Petroleum-snet4"
    name                 = "Backend-vm2"
    nic_data_name        = "Petroleum_nic4"
    resource_group_name  = "Backend-RG"
    location             = "France Central"
    size                 = "Standard_F2"
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
    publisher            = "Canonical"
    offer                = "0001-com-ubuntu-server-jammy"
    sku                  = "22_04-lts"
    version              = "latest"
    kv_name              = "petroleumkv2"
    secret_name1         = "username"
    secret_name2         = "password"
  }
}

Petroleum_kv_details = {
  kv1 = {
    name                = "petroleumkv1"
    resource_group_name = "Frontend-RG"
    location            = "Mexico Central"
    sku_name            = "standard"
  }
  kv2 = {
    name                = "petroleumkv2"
    resource_group_name = "Backend-RG"
    location            = "France Central"
    sku_name            = "standard"
  }
}

Petroleum_secret_details = {
  secret1 = {
    kv_name             = "petroleumkv1"
    secret_name         = "username"
    secret_value        = "Petroleumadmin"
    resource_group_name = "Frontend-RG"
  }
  secret2 = {
    kv_name             = "petroleumkv1"
    secret_name         = "password"
    secret_value        = "info@123"
    resource_group_name = "Frontend-RG"
  }
  secret3 = {
    kv_name             = "petroleumkv2"
    secret_name         = "username"
    secret_value        = "Petroleumadmin"
    resource_group_name = "Backend-RG"
  }
  secret4 = {
    kv_name             = "petroleumkv2"
    secret_name         = "password"
    secret_value        = "info@123"
    resource_group_name = "Backend-RG"
  }
}


Petroleum_applicationGateway_details = {
  ag1 = {
    name                 = "Frontend-AppGateway"
    resource_group_name  = "Frontend-RG"
    location             = "Mexico Central"
    snet_name            = "AzureApplicationGateway"
    virtual_network_name = "Frontend-vnet"
    sku_name             = "Standard_v2"
    tier                 = "Standard_v2"
    capacity             = 2
    # min_capacity                  = 0
    # max_capacity                  = 10
    pip_name                      = "ag-pip"
    gateway_ipconfiguration_name  = "Petroleum_gateway_ipconfig"
    frontend_ipconfiguration_name = "frontend_ipconfig"
    frontend_port_name            = "frontend-port"
    frontend_port                 = 80
    backend_address_pool_name     = "backendpool_gateway"
    backend_http_settings_name    = "baclend_http_setting"
    cookie_based_affinity         = "Disabled"
    # path                          = "http://www.yogeshpawar.cloud/"
    port                      = 80
    protocol                  = "Http"
    request_timeout           = 60
    http_listener_name        = "jay.yogeshpawar.cloud"
    request_routing_rule_name = "appgateway_request_rule"
    priority                  = 1
    rule_type                 = "Basic"

  }
}
