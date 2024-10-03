rg-block = {
  rg1 = {
    name     = "todo-rg-jay"
    location = "BrazilSouth"
  }
}

vnet-block = {
  vnet1 = {
    name                = "todo-vnet"
    resource_group_name = "todo-rg-jay"
    location            = "BrazilSouth"
    address_space       = ["10.0.0.0/16"]
  }
}

snet-block = {
  snet1 = {
    name                 = "frontend_sub"
    resource_group_name  = "todo-rg-jay"
    virtual_network_name = "todo-vnet"
    address_prefixes     = ["10.0.0.0/24"]
  }
  snet2 = {
    name                 = "backend_sub"
    resource_group_name  = "todo-rg-jay"
    virtual_network_name = "todo-vnet"
    address_prefixes     = ["10.0.50.0/24"]
  }
}

vm-block = {
  vm1 = {
    resource_group_name  = "todo-rg-jay"
    location             = "BrazilSouth"
    pip_name             = "vm-pip1"
    nic_name             = "vm-nic1"
    name                 = "Frontend-vm"
    subnet_name          = "frontend_sub"
    virtual_network_name = "todo-vnet"
  }
  vm2 = {
    resource_group_name  = "todo-rg-jay"
    location             = "BrazilSouth"
    pip_name             = "vm-pip2"
    nic_name             = "vm-nic2"
    name                 = "Backend-vm"
    subnet_name          = "backend_sub"
    virtual_network_name = "todo-vnet"
  }
}
