# terraform {
#   required_providers {
#     spheron = {
#       # version = "0.1"
#       source = "spheron/spheron"
#     }
#   }
# }
terraform {
  required_providers {
    spherontest = {
      source  = "ilij4/spherontest"
      version = "0.0.5"
    }
  }
}

provider "spherontest" {
  token = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhcGlLZXkiOiJjZmU0YmM0NTRmMzA0MTg5NDk0NzUyZmUyOGY4YTg3MDEzOWRhMGM3NzkxMjM4YzY2NDY3MGM0Y2NjZDBmNmNmN2ZkNDAwOGNkMDNjN2U1NGExZTA1OWJmYzIyZWYzZDZlN2YyNGNhYmM1NWI1ZDQ5OWY4OGNjOTk4MDc3MjY4OCIsImlhdCI6MTY4NjY2NzIwNiwiaXNzIjoid3d3LnNwaGVyb24ubmV0d29yayJ9.lpC-lSr7kxh1ITq7rUHfT4cd7eBRRMF1wKEVp5WAfaA"
}

# provider "spheron" {
#   token = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhcGlLZXkiOiJjZmU0YmM0NTRmMzA0MTg5NDk0NzUyZmUyOGY4YTg3MDEzOWRhMGM3NzkxMjM4YzY2NDY3MGM0Y2NjZDBmNmNmN2ZkNDAwOGNkMDNjN2U1NGExZTA1OWJmYzIyZWYzZDZlN2YyNGNhYmM1NWI1ZDQ5OWY4OGNjOTk4MDc3MjY4OCIsImlhdCI6MTY4NjY2NzIwNiwiaXNzIjoid3d3LnNwaGVyb24ubmV0d29yayJ9.lpC-lSr7kxh1ITq7rUHfT4cd7eBRRMF1wKEVp5WAfaA"
# }


# resource "spherontest_instance" "instance_test" {
#   image         = "crccheck/hello-world"
#   tag           = "latest"
#   cluster_name  = "tf_v2_test"
#   region        = "any"
#   machine_image = "Ventus Small"

#   # args     = ["arg"]
#   # commands = ["command"]

#   ports = [
#     {
#       container_port = 8000
#     }
#   ]

#   health_check = {
#     path = "/"
#     port = 8000
#   }
# }

resource "spherontest_instance" "instance_test2" {
  image         = "crccheck/hello-world"
  tag           = "latest"
  cluster_name  = "tf_test"
  region        = "any"
  machine_image = "Ventus Small"

  args     = ["arg"]
  commands = ["command"]

  ports = [
    {
      container_port = 8000
      exposed_port   = 80
    }
  ]
  env = [
    {
      key   = "k",
      value = "v"
    }
  ]

  health_check = {
    path = "/"
    port = 8000
  }
}

# output "instance_id" {
#   value = spheron_instance.instance_test.id
# }

resource "spherontest_domain" "domain_test" {
  name = "test.com"
  type = "domain"

  instance_port = spherontest_instance.instance_test2.ports[0].container_port
  instance_id   = spherontest_instance.instance_test2.id
}

# resource "spheron_marketplace_instance" "instance_market_test" {
#   name          = "Postgres"
#   machine_image = "Ventus Nano"

#   env = [
#     {
#       key   = "POSTGRES_PASSWORD"
#       value = "passSecrettt"
#     },
#     {
#       key   = "POSTGRES_USER"
#       value = "admin"
#     },
#     {
#       key   = "POSTGRES_DB"
#       value = "myDB"
#     }
#   ]

#   region = "any"
# }

# resource "spheron_marketplace_instance" "instance_IPFS_test" {
#   name          = "IPFS"
#   machine_image = "Ventus Nano"
#   region        = "any"
# }

# resource "spheron_domain" "domain_test_ipfs" {
#   name = "test.com"
#   type = "domain"

#   instance_port = spheron_marketplace_instance.instance_IPFS_test.ports[0].container_port
#   instance_id   = spheron_marketplace_instance.instance_IPFS_test.id
# }
