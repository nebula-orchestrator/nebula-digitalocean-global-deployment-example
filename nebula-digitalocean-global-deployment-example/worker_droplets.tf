# create the droplets
resource "digitalocean_droplet" "nebula-worker" {
  count  = var.worker_count
  depends_on = [null_resource.wait_for_manager_to_start]
  image  = "rancheros"
  name   = "nebula-worker-0${count.index+1}"
  region = var.worker_region_droplet[count.index]
  size   = var.worker_size
  private_networking = true
  ssh_keys = [data.digitalocean_ssh_key.nebula_keys.id]
  user_data = templatefile("${path.module}/cloud_init/worker/user-data.tpl",  {manager_host = digitalocean_droplet.nebula-manager.ipv4_address})
}
