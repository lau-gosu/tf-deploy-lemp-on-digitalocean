#  export DO_PAT="YOUR DO TOKEN"
variable "do_token" {
    description = "DigitalOcean Api Token"
}

variable "region" {
  description = "DigitalOcean region"
}
variable "droplet_image" {
  description = "DigitalOcean droplet image name"
}
variable "droplet_size" {
  description = "Droplet size for server"
}
variable "domain_name" {
  description = "Domain name"
}
variable "reserved_ip" {
  description = "Your Static IP"
}
variable "ssh_key" {
  description = "Your SSH key"
}