provider "helm" {
  kubernetes {
    config_path = "/conf/config"
  }
}
 
provider "kubernetes" {
  config_path    = "/conf/config"
  config_context = "microk8s"
}