module "Petroleum_rg_module" {
  source        = "./Petroleum-rg"
  Petroleum-rgs = var.Petroleum_rg_details
}

module "Petroleum_vnet_module" {
  depends_on      = [module.Petroleum_rg_module]
  source          = "./Petroleum-vnet"
  Petroleum-vnets = var.Petroleum_vnet_details
}

module "Petroleum_snet_module" {
  depends_on      = [module.Petroleum_vnet_module]
  source          = "./Petroleum-snet"
  Petroleum-snets = var.Petroleum_snet_details
}

module "Petroleum_nic_module" {
  depends_on              = [module.Petroleum_snet_module]
  source                  = "./Petroleum-nic"
  Petroleum-nics          = var.Petroleum_nic_details
  Petroleum-nics-sub-data = var.Petroleum_snet_details
}

module "Petroleum_vm_module" {
  depends_on            = [module.Petroleum_nic_module]
  source                = "./Petroleum-vm"
  Petroleum-vms         = var.Petroleum_vm_details
  Petroleum_vm_nic_data = var.Petroleum_nic_details
}


module "Petroleum_nsg_module" {
  depends_on     = [module.Petroleum_nic_module]
  source         = "./Petroleum-nsg"
  Petroleum-nsgs = var.Petroleum_nsg_details
}

module "Petroleum_nsg_association_module" {
  depends_on                 = [module.Petroleum_nic_module, module.Petroleum_nsg_module]
  source                     = "./Petroleum-nsg-association"
  Petroleum-nsg-associations = var.Petroleum-nsg-association_details
}


module "Petroleum_bastion_module" {
  depends_on        = [module.Petroleum_snet_module]
  source            = "./Petroleum-bastion"
  Petroleum_bastion = var.Petroleum_bastion_details
}
