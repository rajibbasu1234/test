provider "google" {
  project     = "engaged-iridium-418715"
  region      = "us-east1"
  zone        = "us-east1-b"
}
resource "google_compute_instance" "default" {
  provider = google
  name = "default"
  machine_type = "e2-micro"

  ### ADD THIS BLOCK
  metadata = {
    ssh-keys = "rajibbasu123:${file("~/.ssh/id_rsa.pub")}"
  }

  network_interface {
    network = "default"
  }

  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-2004-focal-v20220712"
    }
  }
  # Some changes require full VM restarts
  # consider disabling this flag in production
  #   depending on your needs
  allow_stopping_for_update = true
}