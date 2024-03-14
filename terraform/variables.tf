#  export DO_PAT="YOUR DO TOKEN"
variable "do_token" {
    description = "DigitalOcean Api Token"
}

# Choose Region, Image, Size from: https://slugs.do-api.dev/
variable "region" {
  description = "DigitalOcean region"
  default = "fra1"
}
variable "droplet_image" {
  description = "DigitalOcean droplet image name"
  default = "ubuntu-22-04-x64"

}
variable "droplet_size" {
  description = "Droplet size for server"
  default = "s-1vcpu-1gb-intel"
}
# Choose your domain name:
variable "domain_name" {
  description = "Domain name"
  default = "cofetariaboem.ro"
}

