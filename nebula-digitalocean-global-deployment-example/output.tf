# print a list of IP's of all the workers
output "workers_ip_list" {
  value = digitalocean_droplet.nebula-worker.*.ipv4_address
}

# print the IP of the manager
output "manager_ip" {
  value = digitalocean_droplet.nebula-manager.ipv4_address
}

# print the docker command to add more workers
output "docker_run_command_to_add_more_workers" {
  value = "docker run -d --restart unless-stopped -v /var/run/docker.sock:/var/run/docker.sock --env DEVICE_GROUP=example --env REGISTRY_HOST=https://index.docker.io/v1/ --env MAX_RESTART_WAIT_IN_SECONDS=0 --env NEBULA_MANAGER_AUTH_USER=nebula --env NEBULA_MANAGER_AUTH_PASSWORD=nebula --env NEBULA_MANAGER_HOST=${digitalocean_droplet.nebula-manager.ipv4_address} --env NEBULA_MANAGER_PORT=80 --env nebula_manager_protocol=http --env NEBULA_MANAGER_CHECK_IN_TIME=5 --name nebula-worker nebulaorchestrator/worker"
}
