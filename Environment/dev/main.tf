module "rg" {
  source = "../../Modules/rg"
  rg-block = var.rg-block
}
module "vnet" {
  source = "../../Modules/vnet"
  vnet-block = var.vnet-block
  depends_on = [ module.rg ]
}
module "snet" {
  source = "../../Modules/snet"
  snet-block = var.snet-block
  depends_on = [ module.vnet ]
}
module "vm" {
  source = "../../Modules/vm"
  vm = var.vm-block
  depends_on = [ module.snet, module.rg, module.vnet ]
}