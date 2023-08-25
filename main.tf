locals {
  env_code = element(split("", var.environment), 0)
}

resource "random_string" "instance_name" {
  length  = 4
  special = false
  upper   = false
}

resource "random_password" "root_password" {
  length  = 16
  special = true
}

resource "google_compute_instance" "vm_instance" {
  name         = "${var.instance_name}-${local.env_code}-${random_string.instance_name.result}"
  machine_type = var.machine_type
  zone         = var.zone
  labels       = var.labels


  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-2004-lts"
    }
  }

  network_interface {
    network    = var.network_id
    subnetwork = var.subnet_id
    access_config {
      nat_ip = var.public_ip ? null : ""
    }
  }

  metadata = {
    ssh-keys = "kjs:${file(var.publickeypath)}"
  }

  provisioner "remote-exec" {
    connection {
      host        = google_compute_instance.vm_instance.network_interface.0.access_config.0.nat_ip
      type        = "ssh"
      port        = 22
      user        = var.user
      timeout     = "50s"
      private_key = file(var.privatekeypath)
    }
    inline = [
      "sudo passwd root",
      "echo '${random_password.root_password.result}'",
      "echo '${random_password.root_password.result}'",
    ]
  }
}


