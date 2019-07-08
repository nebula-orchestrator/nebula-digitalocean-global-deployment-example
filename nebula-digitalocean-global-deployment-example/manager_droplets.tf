# create the droplets
resource "digitalocean_droplet" "nebula-manager" {
  image  = "centos-7-x64"
  name   = "nebula-manager-01"
  region = var.server_region_droplet
  size   = var.server_size
  private_networking = true
  ssh_keys = [data.digitalocean_ssh_key.nebula_keys.id]
  user_data = templatefile("${path.module}/cloud_init/manager/user-data.tpl",  {})
}
