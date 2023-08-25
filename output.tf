output "vm_name" {
  value = google_compute_instance.vm_instance.name
}

output "private_ip" {
  value = google_compute_instance.vm_instance.network_interface.0.network_ip
}

output "public_ip" {
  value = google_compute_instance.vm_instance.network_interface.0.access_config.0.nat_ip
}

output "root_password" {
  value     = random_password.root_password.result
  sensitive = true
}