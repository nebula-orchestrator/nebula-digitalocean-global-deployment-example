# the server size you want
variable "server_size" {
  type = "string"
  default = "2gb"
}

# the region where server droplets will be deployed
variable "server_region_droplet" {
  type = "string"
  default = "nyc3"
}

# name of a single ssh pub key to attach to the instance
variable "ssh_key_name" {
  type = "string"
}

# the count of how many servers you want
variable "worker_count" {
  type = "string"
  default = 9
}

# a list of regions where droplets will be deployed
variable "worker_region_droplet" {
  type = "list"
  default = [
    "nyc1",
    "nyc3",
    "sfo2",
    "ams3",
    "sgp1",
    "lon1",
    "fra1",
    "tor1",
    "blr1"
  ]
}

# the server size you want
variable "worker_size" {
  type = "string"
  default = "2gb"
}

# do token
variable "digital_ocean_token" {
  type = "string"
}
