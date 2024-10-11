module "rgs" {
  source = "./rg"
  rgs = var.rgs
}
module "sas" {
  source = "./storage-account"
  sas = var.sas
  depends_on = [ module.rgs ]
}