Petroleum_rg_details = {
  rg1 = {
    name     = "Petroleum-rg"
    location = "Central India"
  }
}

Petroleum_vnet_details = {
  vnet1 = {
    name                = "Petroleum-vnet"
    location            = "Central India"
    resource_group_name = "Petroleum-rg"
    address_space       = ["10.0.0.0/16"]
  }
}

Petroleum_snet_details = {
  snet1 = {
    name                 = "Petroleum-snet"
    resource_group_name  = "Petroleum-rg"
    virtual_network_name = "Petroleum-vnet"
    address_prefixes     = ["10.0.2.0/24"]
  }
}

Petroleum_pip_details = {
  pip1 = {
    name                = "Petroleum-pip"
    location            = "Central India"
    resource_group_name = "Petroleum-rg"
    allocation_method   = "Static"
  }
}

Petroleum_nsg_details = {
  nsg1 = {
    name                = "Petroleum-nsg"
    location             = "Central India"
    resource_group_name = "Petroleum-rg"
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
  nic1 = {
    name                = "Petroleum-nic"
    location            = "Central India"
    resource_group_name = "Petroleum-rg"
    ip_configuration = {
      name                          = "Petroleum-ipconfig"
      private_ip_address_allocation = "Dynamic"
      public_ip_address_id          = "/subscriptions/f528c591-fe1e-4c79-a199-3dc70d54270b/resourceGroups/Petroleum-rg/providers/Microsoft.Network/publicIPAddresses/Petroleum-pip"
      subnet_id                     = "/subscriptions/f528c591-fe1e-4c79-a199-3dc70d54270b/resourceGroups/Petroleum-rg/providers/Microsoft.Network/virtualNetworks/Petroleum-vnet/subnets/Petroleum-snet"
    }
  }
}


Petroleum-nsg-association_details = {
  association1 = {
    network_interface_id      = "/subscriptions/f528c591-fe1e-4c79-a199-3dc70d54270b/resourceGroups/Petroleum-rg/providers/Microsoft.Network/networkInterfaces/Petroleum-nic"
    network_security_group_id = "/subscriptions/f528c591-fe1e-4c79-a199-3dc70d54270b/resourceGroups/Petroleum-rg/providers/Microsoft.Network/networkSecurityGroups/Petroleum-nsg"
  }
}

Petroleum_vm_details = {
  vm1 = {
    name                            = "Petroleum-vm"
    location                         = "Central India"
    resource_group_name             = "Petroleum-rg"
    size                            = "Standard_F2"
    admin_username                  = "Petroleumadmin"
    admin_password                  = "Petroleum@12345"
    disable_password_authentication = false
    network_interface_ids           = ["/subscriptions/f528c591-fe1e-4c79-a199-3dc70d54270b/resourceGroups/Petroleum-rg/providers/Microsoft.Network/networkInterfaces/Petroleum-nic"]

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
