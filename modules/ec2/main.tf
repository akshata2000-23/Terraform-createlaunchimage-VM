# provider "google-beta" {
#   project     = "sample-env"
#   region      = "asia-southeast1"
#   zone        = "asia-southeast1-b"
# }

#step 1 -->  creating AMI from existing instances 
resource "google_compute_machine_image" "image" {
  provider        = google-beta
  name            = var.source_image_name
#   source_instance = google_compute_instance.vm.self_link
source_instance = var.source_instance_name #name of instance from which we are creating instance  #dev1-app
project = "calm-grid-450707-m8"

} 

### create instances using the image created above

resource "google_compute_instance_from_machine_image" "tpl" {
  provider = google-beta
  name     = var.compute_instance_name ####dev1-app-1
  #source_machine_image = var.source_image_name
  #source_machine_image = "projects/calm-grid-450707-m8/global/machineImages/docker2-image"
  source_machine_image = format("projects/%s/global/machineImages/%s", var.project-id, var.source_image_name)
  machine_type = "e2-medium"
  #project = "calm-grid-450707-m8"
  project= var.project-id

  labels = {
    my_key = "my_value"
  }
  
}
