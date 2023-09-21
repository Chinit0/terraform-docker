/*
  Bloque utilizado para añadir el docker provider. Un provider es una abstracción de una API a lenguaje utilizado por Terraform.
  De esta manera, podremos interactuar con la API de docker dentro de un archivo de Terraform
*/
terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      # version = "~> 3.0.0"
    }
  }
}

# provider "docker" {

# }