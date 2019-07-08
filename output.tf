# print a list of IP's of all the workers
output "workers_ip_list" {
  value = module.run_example.workers_ip_list
}

# print the IP of the manager
output "manager_ip" {
  value = module.run_example.manager_ip
}
