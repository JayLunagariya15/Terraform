module "Petroleum-rg-module" {
  source       = "./Petroleum-rg"
  Petroleum-rg = var.Petroleum-rg-details
}

module "Petroleum-sa-module" {
  source                    = "./Petroleum-storageAccount"
  depends_on                = [module.Petroleum-rg-module]
  Petroleum-storage-account = var.Petroleum-sa-details
}

module "Petroleum-sc-module" {
  source                      = "./Petroleum-storageContainer"
  depends_on                  = [module.Petroleum-sa-module]
  Petroleum-storage-container = var.Petroleum-sc-details
}
