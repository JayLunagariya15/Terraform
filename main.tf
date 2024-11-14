module "rg" {
  source = "./rg"
  k8s-rg = var.rg-module
}

module "cluster" {
  source = "./cluster"
  k8s-cluster = var.cluster-module
  depends_on = [ module.rg ]
}