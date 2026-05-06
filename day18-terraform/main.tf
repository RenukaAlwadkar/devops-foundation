# 1. Define Terraform and Docker Provider
terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0.1"
    }
  }
}

provider "docker" {}

# 2. Pull NGINX image
resource "docker_image" "nginx" {
  name         = "nginx:latest"
  keep_locally = false
}

# 3. Create container
resource "docker_container" "nginx_server" {
  image = docker_image.nginx.image_id
  name  = "meetmux_web_server"

  ports {
    internal = 80
    external = var.external_port
  }
}