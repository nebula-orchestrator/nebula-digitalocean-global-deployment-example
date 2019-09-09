# nebula-digitalocean-global-deployment-example

A simple example that runs a Nebula manager with workers spread out across the world, the terraform output will return the manger_ip which you can connect to on port 80 with the username `nebula` and password `nebula` & a list of all workers which by default will run the example app on port `81`.


## Running instructions

 1. clone the repo
 2. cd into the repo folder
 3. Change the run.tf (in repo root folder) to your variables 
 4. run `terraform apply`.
 
You now have a nebula cluster that includes a single manager and as many workers you gave it (default 9) spread out across digital regions (default 9 regions).
 
## Requires: 

 - terraform 0.12.0 or higher
 - [DIGITALOCEAN_TOKEN](https://www.terraform.io/docs/providers/do/index.html#token) envvar set to your digital ocean token
 - an ssh pub key pre uploaded to digital ocean
 - curl installed on the machine running terraform
 
## Configuration variables  :

 - server_size - the size of the Nebula manager server - defaults to `2gb`
 - server_region_droplet - the region where the nebula manager server will reside - defaults to `nyc3`
 - ssh_key_name - the public ssh key as given in digital ocean that will be attached to the droplets, requires a single name - required
 - worker_count - the number of Nebula workers to create - defaults to `9`
 - worker_region_droplet - the regions where the workers will be deployed on - defaults to `["nyc1", "nyc3", "sfo2", "ams3", "sgp1", "lon1", "fra1", "tor1", "blr1"]`
 - worker_size - the size of the servers used in Nebula - note that at least 1GB is needed as it uses a RancherOS for simplicity sake - defaults to `2gb`
 - DIGITALOCEAN_TOKEN - the token used to connect to your digital ocean account - needs to be declared as an envvar - required
 
 Should you want to ssh to the droplets for any reason (not needed for the system to work) you can do so with the private key & the `centos` user for the manager and `rancher` user for the workers.
 
## this can take 10-15 minutes for the manager to start as it has to install docker & docker-compose then download and run all containers, the initial boot of the workers is considerably faster but it might still be a couple of minutes after the terraform run completes.
