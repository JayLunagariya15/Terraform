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
  depends_on   = [module.Petroleum-nic-module]
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
  depends_on   = [module.Petroleum-rg-module]
  source       = "./Petroleum-loadBalancer"
  Petroleum_lb = var.Petroleum_lb_details
}

# module "Petroleum-rg-module" {
#   source       = "./Petroleum-rg"
#   Petroleum_rg = var.Petroleum-rg-details
# }

# module "Petroleum-vnet-module" {
#   depends_on     = [module.Petroleum-rg-module]
#   source         = "./Petroleum-vnet"
#   Petroleum_vnet = var.Petroleum-vnet-details
# }

# module "Petroleum-snet-module" {
#   depends_on     = [module.Petroleum-vnet-module]
#   source         = "./Petroleum-snet"
#   Petroleum_snet = var.Petroleum-snet-details
# }

# module "Petroleum-nic-module" {
#   depends_on    = [module.Petroleum-snet-module]
#   source        = "./Petroleum-nic"
#   Petroleum_nic = var.Petroleum-nic-details
# }

# module "Petroleum-vm-module" {
#   depends_on   = [module.Petroleum-nic-module]
#   source       = "./Petroleum-vm"
#   Petroleum_vm = var.Petroleum-vm-details
# }

# module "Petroleum-keyVault-module" {
#   depends_on   = [module.Petroleum-rg-module]
#   source       = "./Petroleum-keyVault"
#   Petroleum_kv = var.Petroleum-kv-details
# }

# module "Petroleum-secret-module" {
#   depends_on       = [module.Petroleum-keyVault-module]
#   source           = "./Petroleum-secret"
#   Petroleum_secret = var.Petroleum-secret-details
# }

# module "Petroleum-bastion-module" {
#   depends_on        = [module.Petroleum-snet-module]
#   source            = "./Petroleum-bastion"
#   Petroleum_bastion = var.Petroleum-bastion-details
# }

# module "Petroleum-loadBalancer-module" {
#   depends_on   = [module.Petroleum-rg-module]
#   source       = "./Petroleum-loadBalancer"
#   Petroleum_lb = var.Petroleum-lb-details
# }