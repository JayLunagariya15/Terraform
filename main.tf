terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.0.1"
    }
  }
}

provider "azurerm" {
  features {

  }
  subscription_id = "ac30d9b8-34e5-4948-80d1-d9c571735ea3"
}

resource "azurerm_resource_group" "Petroleum_rg" {
  name     = "Petroleum-rg"
  location = "Japan East"
}

resource "azurerm_virtual_network" "Petroleum_vnet" {
  name                = "Petroleum-vnet"
  resource_group_name = azurerm_resource_group.Petroleum_rg.name
  location            = azurerm_resource_group.Petroleum_rg.location
  address_space       = ["10.0.0.0/16"]
}

resource "azurerm_subnet" "Petroleum_snet" {
  name                 = "Petroleum-snet"
  resource_group_name  = azurerm_resource_group.Petroleum_rg.name
  virtual_network_name = azurerm_virtual_network.Petroleum_vnet.name
  address_prefixes     = ["10.0.0.0/28"]
}

resource "azurerm_public_ip" "Petroleum_pip" {
  name                = "Petroleum_pip"
  resource_group_name = azurerm_resource_group.Petroleum_rg.name
  location            = azurerm_resource_group.Petroleum_rg.location
  allocation_method   = "Static"
}

resource "azurerm_network_interface" "Petroleum_nic" {
  name                = "Petroleum-nic"
  resource_group_name = azurerm_resource_group.Petroleum_rg.name
  location            = azurerm_resource_group.Petroleum_rg.location
  ip_configuration {
    name                          = "petroleum-ipconfig"
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.Petroleum_pip.id
    subnet_id                     = azurerm_subnet.Petroleum_snet.id
  }
}

resource "azurerm_network_security_group" "Petroleum_nsg" {
  name                = "Petroleum-nsg"
  resource_group_name = azurerm_resource_group.Petroleum_rg.name
  location            = azurerm_resource_group.Petroleum_rg.location
  security_rule  {
    name                       = "Petroleum-nsg-rule"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}

resource "azurerm_windows_virtual_machine" "Petroleum_vm" {
  name                  = "Petroleum-vm"
  resource_group_name   = azurerm_resource_group.Petroleum_rg.name
  location              = azurerm_resource_group.Petroleum_rg.location
  size                  = "Standard_F2"
  admin_username        = "adminuser"
  admin_password        = "Lunagariya@123"
  network_interface_ids = [azurerm_network_interface.Petroleum_nic.id]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2016-Datacenter"
    version   = "latest"
  }
}