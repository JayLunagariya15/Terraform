Petroleum_rg_details = {
  rg1 = {
    name     = "Petroleum-rg-Jay"
    location = "Japan East"
  }
}

Petroleum_vnet_details = {
  vnet1 = {
    name                = "Petroleum-vnet"
    location            = "Japan East"
    resource_group_name = "Petroleum-rg-Jay"
    address_space       = ["10.0.0.0/16"]
  }
}

Petroleum_snet_details = {
  snet1 = {
    name                 = "Petroleum-snet"
    resource_group_name  = "Petroleum-rg-Jay"
    virtual_network_name = "Petroleum-vnet"
    address_prefixes     = ["10.0.2.0/24"]
  }
  snet2 = {
    name                 = "Petroleum-snet-2"
    resource_group_name  = "Petroleum-rg-Jay"
    virtual_network_name = "Petroleum-vnet"
    address_prefixes     = ["10.0.28.0/24"]
  }
}

Petroleum_nsg_details = {
  nsg1 = {
    name                = "Petroleum-nsg"
    location            = "Japan East"
    resource_group_name = "Petroleum-rg-Jay"
    security_rule = {
      name                       = "Petroleum-securityrule"
      priority                   = 100
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "22"
      source_address_prefix      = "*"
      destination_address_prefix = "*"
    }
  }
  nsg2 = {
    name                = "Petroleum-nsg-2"
    location            = "Japan East"
    resource_group_name = "Petroleum-rg-Jay"
    security_rule = {
      name                       = "Petroleum-securityrule"
      priority                   = 100
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "22"
      source_address_prefix      = "*"
      destination_address_prefix = "*"
    }
  }
}


Petroleum_nic_details = {
  snet1 = {
    subnet              = "snet1"
    name                = "Petroleum-nic"
    location            = "Japan East"
    resource_group_name = "Petroleum-rg-Jay"
    ip_configuration = {
      name                          = "Petroleum-ipconfig"
      private_ip_address_allocation = "Dynamic"
    }
  }
  snet2 = {
    subnet              = "snet2"
    name                = "Petroleum-nic-2"
    location            = "Japan East"
    resource_group_name = "Petroleum-rg-Jay"
    ip_configuration = {
      name                          = "Petroleum-ipconfig"
      private_ip_address_allocation = "Dynamic"
    }
  }
}

Petroleum_vm_details = {
  snet1 = {
    nic                             = "nic1"
    name                            = "Petroleum-vm"
    location                        = "Japan East"
    resource_group_name             = "Petroleum-rg-Jay"
    size                            = "Standard_F2"
    disable_password_authentication = false

    os_disk = {
      caching              = "ReadWrite"
      storage_account_type = "Standard_LRS"
    }
    source_image_reference = {
      publisher = "Canonical"
      offer     = "0001-com-ubuntu-server-jammy"
      sku       = "22_04-lts"
      version   = "latest"
    }
  }
  snet2 = {
    nic                             = "nic2"
    name                            = "Petroleum-vm-2"
    location                        = "Japan East"
    resource_group_name             = "Petroleum-rg-Jay"
    size                            = "Standard_F2"
    disable_password_authentication = false

    os_disk = {
      caching              = "ReadWrite"
      storage_account_type = "Standard_LRS"
    }
    source_image_reference = {
      publisher = "Canonical"
      offer     = "0001-com-ubuntu-server-jammy"
      sku       = "22_04-lts"
      version   = "latest"
    }
  }
}
Petroleum-nsg-association_details = {
  association1 = {
    network_interface_id      = "/subscriptions/f528c591-fe1e-4c79-a199-3dc70d54270b/resourceGroups/Petroleum-rg-Jay/providers/Microsoft.Network/networkInterfaces/Petroleum-nic"
    network_security_group_id = "/subscriptions/f528c591-fe1e-4c79-a199-3dc70d54270b/resourceGroups/Petroleum-rg-Jay/providers/Microsoft.Network/networkSecurityGroups/Petroleum-nsg"
  }
  # association2={
  #   network_interface_id = 
  #   network_security_group_id =
  # }
}
