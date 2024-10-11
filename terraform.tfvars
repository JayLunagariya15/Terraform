rg-block = {
  rg1 = {
    resource_group_name = "Jay-RG"
    location            = "North Europe"
  }
}

vnet-block = {
  vnet1 = {
    resource_group_name  = "Jay-RG"
    location             = "North Europe"
    virtual_network_name = "Jay-vnet"
    address_space        = ["10.0.0.0/16"]
  }
  vnet2 = {
    resource_group_name  = "Jay-RG"
    location             = "Canada Central"
    virtual_network_name = "Jay-vnet2"
    address_space        = ["10.1.0.0/16"]
  }
}

snet-block = {
  snet1 = {
    resource_group_name  = "Jay-RG"
    virtual_network_name = "Jay-vnet"
    subnet_name          = "hub"
    address_prefixes     = ["10.0.1.0/24"]
    location             = "North Europe"
  }
  snet2 = {
    resource_group_name  = "Jay-RG"
    virtual_network_name = "Jay-vnet"
    subnet_name          = "spoke1"
    address_prefixes     = ["10.0.60.0/24"]
    location             = "North Europe"
  }
  snet3 = {
    resource_group_name  = "Jay-RG"
    virtual_network_name = "Jay-vnet2"
    subnet_name          = "spoke2"
    address_prefixes     = ["10.1.90.0/24"]
    location             = "Canada Central"
  }
}

vm = {
  vm1 = {
    pip_name             = "vm-pip1"
    resource_group_name  = "Jay-RG"
    location             = "North Europe"
    nic_name             = "nic1"
    name                 = "hub-vm"
    subnet_name          = "hub"
    virtual_network_name = "Jay-vnet"
  }
  vm2 = {
    pip_name             = "vm-pip2"
    resource_group_name  = "Jay-RG"
    location             = "North Europe"
    nic_name             = "nic2"
    name                 = "spoke1-vm"
    subnet_name          = "spoke1"
    virtual_network_name = "Jay-vnet"
  }
  vm3 = {
    pip_name             = "vm-pip3"
    resource_group_name  = "Jay-RG"
    location             = "Canada Central" 
    nic_name             = "nic3"
    name                 = "spoke2-vm"
    subnet_name          = "spoke2"
    virtual_network_name = "Jay-vnet2"  
  }
}
