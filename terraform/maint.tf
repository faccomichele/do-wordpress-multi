terraform {
  required_providers {
    digitalocean = {
      source = "digitalocean/digitalocean"
      version = "2.22.3"
    }
  }
}

provider "digitalocean" {
  # Configure DIGITALOCEAN_ACCESS_TOKEN environment variable on your own
}

resource "digitalocean_droplet" "wordpress" {
  image  = "ubuntu-18-04-x64"
  name   = "wordpress"
  region = "fra1"
  size   = "s-1vcpu-512mb-10gb"
  ssh_keys = [ "e9:fb:ec:94:a8:b4:d8:be:81:f1:14:49:4a:f4:77:92" ]
  user_data = <<USERDATA
WORKING_DIR=/tmp/user-data-exec
mkdir -p $WORKING_DIR
apt-get update && apt-get upgrade -y && apt-get install -y git ansible
cd $WORKING_DIR
git clone https://github.com/faccomichele/do-wordpress-multi.git
cd do-wordpress-multi/ansible
ansible-playbook playbook.yml
USERDATA

}
