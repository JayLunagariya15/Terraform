module "Petroleum-rg-module" {
  source       = "./Petroleum-rg"
  Petroleum_rg = var.Petroleum-rg-details
}

module "Petroleum-vnet-module" {
  depends_on     = [module.Petroleum-rg-module]
  source         = "./Petroleum-vnet"
  Petroleum_vnet = var.Petroleum-vnet-details
}

module "Petroleum-snet-module" {
  depends_on     = [module.Petroleum-vnet-module]
  source         = "./Petroleum-snet"
  Petroleum_snet = var.Petroleum-snet-details
}

module "Petroleum-nic-module" {
  depends_on    = [module.Petroleum-snet-module]
  source        = "./Petroleum-nic"
  Petroleum_nic = var.Petroleum-nic-details
}

module "Petroleum-vm-module" {
  depends_on   = [module.Petroleum-nic-module]
  source       = "./Petroleum-vm"
  Petroleum_vm = var.Petroleum-vm-details
}

module "Petroleum-keyVault-module" {
  depends_on   = [module.Petroleum-rg-module]
  source       = "./Petroleum-keyVault"
  Petroleum_kv = var.Petroleum-kv-details
}

module "Petroleum-secret-module" {
  depends_on       = [module.Petroleum-keyVault-module]
  source           = "./Petroleum-secret"
  Petroleum_secret = var.Petroleum-secret-details
}

module "Petroleum-bastion-module" {
  depends_on        = [module.Petroleum-snet-module]
  source            = "./Petroleum-bastion"
  Petroleum_bastion = var.Petroleum-bastion-details
}