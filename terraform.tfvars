rgs = {
  rg1 = {
    name     = "Jay"
    location = "central india"
  }
}

vnets = {
  vnet1 = {
    name                = "Surat"
    resource_group_name = "Jay"
    location            = "central india"
    address_space       = ["10.0.0.0/16"]
    subnets = {
      snet1 = {
        snetname         = "frontend-surat"
        address_prefixes = ["10.0.1.0/24"]
      }
      snet2 = {
        snetname         = "backend-surat"
        address_prefixes = ["10.0.29.0/24"]
      }
    }
  }
  vnet2 = {
    name                = "Ahmedabad"
    resource_group_name = "Jay"
    location            = "central india"
    address_space       = ["10.1.0.0/16"]
    subnets = {
      snet3 = {
        snetname         = "frontend-ahmedabad"
        address_prefixes = ["10.1.1.0/24"]
      }
      snet4 = {
        snetname         = "backend-ahmedabad"
        address_prefixes = ["10.1.30.0/24"]
      }
    }
  }
}
