# print a list of IP's of all the workers
output "workers_ip_list" {
  value = digitalocean_droplet.nebula-worker.*.ipv4_address
}

# print the IP of the manager
output "manager_ip" {
  value = digitalocean_droplet.nebula-manager.ipv4_address
}
