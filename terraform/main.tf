
# Define Cloud Init script to be ran at provisioning time:
data "template_file" "cloud-init-yaml" {
  template = file("./cloud-init.yaml")
  vars = {
    my_domain_name = var.domain_name
  }
}

# Droplet (LEMP):
resource "digitalocean_droplet" "lemp" {
    name = "lemp"
    image = var.droplet_image
    region = var.region
    size = var.droplet_size
    monitoring = true
    ssh_keys = [
      data.digitalocean_ssh_key.my_ssh_key.id
    ]
    # cloud-init script:
    user_data = data.template_file.cloud-init-yaml.rendered

}

# resource "digitalocean_reserved_ip_assignment" "lemp-reserved-ip" {
#   ip_address = data.digitalocean_reserved_ip.lemp-reserved-ip.ip_address
#   droplet_id = digitalocean_droplet.lemp.id
# }

# Reserved/Fixed IP
resource "digitalocean_reserved_ip" "lemp-fixed-ip" {
  droplet_id = digitalocean_droplet.lemp.id
  region     = digitalocean_droplet.lemp.region
}

# Firewall Configuration:
resource "digitalocean_firewall" "lemp-fw" {
  name = "allow-only-22-80-443-and-icmp"
  droplet_ids = [digitalocean_droplet.lemp.id]

  inbound_rule {
    protocol         = "tcp"
    port_range       = "22"
    source_addresses = ["79.117.151.178/32"]
  }
  inbound_rule {
    protocol         = "tcp"
    port_range       = "80"
    source_addresses = ["0.0.0.0/0", "::/0"]
  }
  inbound_rule {
    protocol         = "tcp"
    port_range       = "443"
    source_addresses = ["0.0.0.0/0", "::/0"]
  }
    inbound_rule {
    protocol         = "icmp"
    source_addresses = ["0.0.0.0/0", "::/0"]
  }

  outbound_rule {
    protocol              = "icmp"
    destination_addresses = ["0.0.0.0/0", "::/0"]
  }
  outbound_rule {
    protocol              = "tcp"
    port_range            = "1-65535"
    destination_addresses = ["0.0.0.0/0", "::/0"]
  }
  outbound_rule {
    protocol              = "udp"
    port_range            = "1-65535"
    destination_addresses = ["0.0.0.0/0", "::/0"]
  }
}


# output "droplet_ip_address" {
#     value = digitalocean_droplet.lemp.ipv4_address
# }

output "droplet_fixed_ip" {
    value = digitalocean_reserved_ip.lemp-fixed-ip.ip_address
    #value = data.digitalocean_reserved_ip.lemp-reserved-ip.ip_address
}
