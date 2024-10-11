module "rg_module" {
  source = "./rg"
  rg-block = var.rg-block
}
module "vnet_module" {
  source = "./vnet"
  vnet-block = var.vnet-block
  depends_on = [ module.rg_module ]
}
module "snet_module" {
  source = "./snet"
  snet-block = var.snet-block
  depends_on = [ module.vnet_module ]
}
module "vm_module" {
  source = "./vm"
  vm = var.vm
  depends_on = [ module.snet_module , module.rg_module , module.vnet_module ]
}