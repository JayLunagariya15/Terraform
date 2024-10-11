rgs = {
  rg1 = {
    name     = "Jay"
    location = "east us"
  }
  rg2 = {
    name     = "shubham"
    location = "central india"
    tags = {
      environment = "dev"
    }
  }
}

sas = {
  sa1 = {
    name                     = "jaysa"
    resource_group_name      = "Jay"
    location                 = "east us"
    account_tier             = "Standard"
    account_replication_type = "LRS"
  }
  sa2 = {
    name                = "shubhamsa"
    resource_group_name = "shubham"
    location            = "central india"
    account_tier        = "Standard"
  }
}
