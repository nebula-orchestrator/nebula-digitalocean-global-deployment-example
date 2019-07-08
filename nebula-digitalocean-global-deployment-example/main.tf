data "digitalocean_ssh_key" "nebula_keys" {
  name = var.ssh_key_name
}

resource "null_resource" "wait_for_manager_to_start" {
  depends_on = [digitalocean_droplet.nebula-manager]
  provisioner "local-exec" {
    command = templatefile("${path.module}/scripts/check_manager.sh.tpl",  {manager_host = digitalocean_droplet.nebula-manager.ipv4_address})
    working_dir = "${path.module}/scripts"
  }
}
