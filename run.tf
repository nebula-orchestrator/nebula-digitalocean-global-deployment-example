module "run_example" {
  source = "./nebula-digitalocean-global-deployment-example"
  ssh_key_name = "your_key_name_here"
  worker_count = 9
  worker_region_droplet = [
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
  digital_ocean_token = "your_digitalocean_token_here"
}
