variable "instance_name" {
  description = "Name for the VM instance"
  type        = string
  default     = "vm-srv001"
}

variable "environment" {
  description = "Environment code (e.g., production)"
  type        = string
  default     = "production"
}

variable "region" {
  description = "Region where the VM will be created"
  type        = string
  default     = "us-east1"
}

variable "zone" {
  description = "Zone where the VM will be created"
  type        = string
  default     = "us-east1-b"
}

variable "machine_type" {
  description = "Machine type for the VM"
  type        = string
  default     = "n2-standard-2"
}

variable "network_id" {
  description = "ID of the existing network"
  type        = string
  default     = "network-prod"
}

variable "subnet_id" {
  description = "ID of the existing subnet"
  type        = string
  default     = "network-prod"
}

variable "public_ip" {
  description = "Provision a public IP for the VM"
  type        = bool
  default     = false
}

variable "labels" {
  description = "Labels to assign to the VM"
  type        = map(string)
  default     = {}
}

variable "user" {
  type    = string
  default = "kjs"
}

variable "privatekeypath" {
  type    = string
  default = "~/.ssh/badal-keys"
}

variable "publickeypath" {
  type    = string
  default = "~/.ssh/badal-keys.pub"
}