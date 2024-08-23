resource "azurerm_resource_group" "Petroleum_rg" {
  name     = "Petroleum-rg"
  location = "Central India"
}

resource "azurerm_virtual_network" "Petroleum_vnet" {
  name                = "Petroleum-vnet"
  location            = azurerm_resource_group.Petroleum_rg.location
  resource_group_name = azurerm_resource_group.Petroleum_rg.name
  address_space       = ["10.0.0.0/16"]
}

resource "azurerm_subnet" "Petroleum_snet" {
  name                 = "Petroleum-snet"
  resource_group_name  = azurerm_resource_group.Petroleum_rg.name
  virtual_network_name = azurerm_virtual_network.Petroleum_vnet.name
  address_prefixes     = ["10.0.2.0/24"]
}

resource "azurerm_public_ip" "Petroleum_pip" {
  name                = "Petroleum-pip"
  location            = azurerm_resource_group.Petroleum_rg.location
  resource_group_name = azurerm_resource_group.Petroleum_rg.name
  allocation_method   = "Static"
}

resource "azurerm_network_security_group" "Petroleum_nsg" {
  name = "Petroleum-nsg"
  location = azurerm_resource_group.Petroleum_rg.location
  resource_group_name = azurerm_resource_group.Petroleum_rg.name
  security_rule  {
    name = "Petroleum-securityrule"
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

resource "azurerm_network_interface" "Petroleum_nic" {
  name                = "Petroleum-nic"
  resource_group_name = azurerm_resource_group.Petroleum_rg.name
  location            = azurerm_resource_group.Petroleum_rg.location
  ip_configuration {
    name                          = "Petroleum-ipconfig"
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.Petroleum_pip.id
    subnet_id                     = azurerm_subnet.Petroleum_snet.id
  }
}

resource "azurerm_network_interface_security_group_association" "Petroleum_association" {
  network_interface_id = azurerm_network_interface.Petroleum_nic.id
  network_security_group_id = azurerm_network_security_group.Petroleum_nsg.id
}

resource "azurerm_linux_virtual_machine" "Petroleum_vm" {
  name                            = "Petroleum-vm"
  resource_group_name             = azurerm_resource_group.Petroleum_rg.name
  location                        = azurerm_resource_group.Petroleum_rg.location
  size                            = "Standard_F2"
  admin_username                  = "Petroleumadmin"
  admin_password                  = "Petroleum@12345"
  disable_password_authentication = false
  network_interface_ids           = [azurerm_network_interface.Petroleum_nic.id]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }
  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }
}
