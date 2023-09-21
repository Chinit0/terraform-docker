//Obtenemos la imagen de nodered de docker. 
//Como se puede observar, utilizamos la notación de resource "nombre del campo del recurso según documentación" "nombre arbitrario"
resource "docker_image" "container_image" {
  name = var.image_in
}