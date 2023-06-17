terraform {
  required_providers {
    spheron = {
      version = "0.1"
      source  = "spheron/spheron"
    }
  }
}

provider "spheron" {
  token = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhcGlLZXkiOiJlMDg3NTQwNGI0NWQ1OTEwZmVjNTFkYzVjNzcyMGQwMDc4NDY5YmFiNmViYmE4ZWQ1NmI3NjQ2ZTY1YTQyZmMyMGRiOTRjYzFiMjI4OTkwM2IwNzk3NmFmMWNiNmM5NzNhYzkyNTA5N2RhMmNhOGFkMDMxZTkyZDQxYjQyNzJjMiIsImlhdCI6MTY4NTQ0MzQyMCwiaXNzIjoid3d3LnNwaGVyb24ubmV0d29yayJ9.EyFbrnMEaDEjV8mvntCtwDfDkV6uI-13DCe0tDVSr30"
}


resource "spheron_instance" "instance_test" {
  image         = "crccheck/hello-world"
  tag           = "latest"
  cluster_name  = "tf_test"
  region        = "any"
  machine_image = "Ventus Small"

  # args     = ["arg"]
  # commands = ["command"]

  ports = [
    {
      container_port = 8000
    }
  ]

  # health_check = {
  #   path = "/"
  #   port = 8000
  # }
}

# output "instance_id" {
#   value = spheron_instance.instance_test.id
# }

# resource "spheron_domain" "domain_test" {
#   name = "test.com"
#   type = "domain"

#   instance_port = spheron_instance.instance_test.ports[0].container_port
#   instance_id   = spheron_instance.instance_test.id
# }

# resource "spheron_marketplace_instance" "instance_market_test" {

#     machine_image = "Ventus Small"

#     env = [
#     {
#       key = 8000
#       name = ""
#     }
#   ]
# }
