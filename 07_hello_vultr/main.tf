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
}

output "instance_ip" {
  value = vultr_instance.elotrm[0].ipv4_address
}

resource "null_resource" "wait_for_ip" {
  depends_on = [vultr_instance.elotrm]

  provisioner "local-exec" {
    command = "sleep 10"
  }
}

resource "vultr_instance" "elotrm_with_connection" {
  plan     = "vc2-1c-1gb"
  region   = "fra"
  os_id    = "387"
  hostname = "elotrm"

  connection {
    type        = "ssh"
    user        = "root"
    private_key = file("C:\\Users\\eturam-ullien\\.ssh\\id_rsa")
    host        = null_resource.wait_for_ip.triggers["instance_ip"]
  }

  provisioner "remote-exec" {
    inline = [
      "sudo apt-get update",
      "sudo apt-get install -y docker.io",
      "sudo systemctl start docker",
      "sudo systemctl enable docker",
      "sudo docker run -d -p 80:80 nginx",
    ]
  }
}

