terraform {
  required_providers {
    digitalocean = {
      source = "digitalocean/digitalocean"
      version = "~> 2.0"
    }
  }
}

provider "digitalocean" {
  token = var.do_token
}

data "digitalocean_ssh_key" "my_ssh_key" {
  name = var.ssh_key
}
data "digitalocean_reserved_ip" "lemp-reserved-ip" {
  ip_address = var.reserved_ip
}
