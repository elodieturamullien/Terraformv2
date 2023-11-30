terraform {
  required_providers {
    vultr = {
      source  = "vultr/vultr"
      version = "2.17.1"
    }
  }
}

provider "vultr" {
  api_key = "SILLVA2A6J3F6S4SKKSNXAPFNZFMWNFF2MRA"
  rate_limit = 100
  retry_limit = 3
}

resource "vultr_instance" "elotrm" {
  plan     = "vc2-1c-1gb"
  region   = "fra"
  os_id    = "387"
  hostname = "elotrm"

  user_data  = <<-EOF
    sudo apt-get update
    sudo apt-get install -y docker.io
    sudo systemctl start docker
    sudo systemctl enable docker
  EOF
}



