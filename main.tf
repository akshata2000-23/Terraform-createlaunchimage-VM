# provider "google" {
#   project     = "sample-env"
#   region      = "asia-southeast1"
#   zone        = "asia-southeast1-b"
# }
provider "google-beta" {
  project = var.project-id
  region  = "asia-south1"
  zone = "asia-south1-a"
}
module "google_compute_instance" {
  source                = "./modules/ec2" #path for module
  zone-name             = var.zone-name
  count                 = var.instance_count                              ##count variable
  compute_instance_name = element(var.compute_instance_name, count.index) ####dev1-app-1

  source_instance_name = element(var.source_instance_name, count.index)
  source_image_name    = element(var.source_image_name, count.index)
  project-id=var.project-id
}
