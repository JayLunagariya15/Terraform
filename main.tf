module "rg" {
  source = "./rg"
  rg = var.rgs
}

module "vnet" {
  source = "./vnet"
  depends_on = [ module.rg ]
  vnets = var.vnets
  subnets = var.subnets
}