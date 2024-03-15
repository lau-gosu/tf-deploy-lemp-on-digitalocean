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
# Choose your domain name:
variable "domain_name" {
  description = "Domain name"
}

