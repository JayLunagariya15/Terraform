module "Petroleum-rg-module" {
  source       = "./Petroleum-rg"
  Petroleum_rg = var.Petroleum_rg_details
}

module "Petroleum-vnet-module" {
  depends_on     = [module.Petroleum-rg-module]
  source         = "./Petroleum-vnet"
  Petroleum_vnet = var.Petroleum_vnet_details
}

module "Petroleum-snet-module" {
  depends_on     = [module.Petroleum-vnet-module]
  source         = "./Petroleum-snet"
  Petroleum_snet = var.Petroleum_snet_details
}

module "Petroleum-nic-module" {
  depends_on    = [module.Petroleum-snet-module]
  source        = "./Petroleum-nic"
  Petroleum_nic = var.Petroleum_nic_details
}

module "Petroleum-vm-module" {
  depends_on   = [module.Petroleum-nic-module, module.Petroleum-secret-module,module.Petroleum-keyVault-module]
  source       = "./Petroleum-vm"
  Petroleum_vm = var.Petroleum_vm_details
}

module "Petroleum-keyVault-module" {
  depends_on   = [module.Petroleum-rg-module]
  source       = "./Petroleum-keyVault"
  Petroleum_kv = var.Petroleum_kv_details
}

module "Petroleum-secret-module" {
  depends_on       = [module.Petroleum-keyVault-module]
  source           = "./Petroleum-secret"
  Petroleum_secret = var.Petroleum_secret_details
}

module "Petroleum-bastion-module" {
  depends_on        = [module.Petroleum-snet-module]
  source            = "./Petroleum-bastion"
  Petroleum_bastion = var.Petroleum_bastion_details
}

module "Petroleum-loadBalancer-module" {
  depends_on   = [module.Petroleum-rg-module,module.Petroleum-vnet-module,module.Petroleum-vm-module,module.Petroleum-nic-module]
  source       = "./Petroleum-loadBalancer"
  Petroleum_lb = var.Petroleum_lb_details
  Petroleum_lb_nic = var.Petroleum_lb_nic_details
}

module "Petroleum-nsg-module" {
  depends_on = [ module.Petroleum-nic-module ]
  source = "./Petroleum-nsg"
  Petroleum_nsgs = var.Petroleum_nsg_details
}
