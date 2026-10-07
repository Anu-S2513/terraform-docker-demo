terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0"
    }
  }
}

provider "docker" {
}

resource "docker_image" "nodejs_app" {
  name = "nodejs-demoapp:latest"
}

resource "docker_container" "nodejs_app" {
  name  = "terraform-nodejs-demoapp"
  image = docker_image.nodejs_app.image_id

  ports {
    internal = 3000
    external = 3001
  }
}