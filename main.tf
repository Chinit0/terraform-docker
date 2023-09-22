# resource "null_resource" "dockervol"{
#   provisioner "local-exec"{
#     command = "mkdir noderedvol/ || true && sudo chown -R 1000:1000 noderedvol/"
#   }
# }
locals {
  deployment = {
    nodered = {
      container_count = length(var.ext_port["nodered"][terraform.workspace])
      image          = var.image["nodered"][terraform.workspace]
      int            = 1880
      ext            = var.ext_port["nodered"][terraform.workspace]
      container_path = "/data"
    }
    influxdb = {
      container_count = length(var.ext_port["influxdb"][terraform.workspace])
      image          = var.image["influxdb"][terraform.workspace]
      int            = 8086
      ext            = var.ext_port["influxdb"][terraform.workspace]
      container_path = "/var/lib/influxdb"
    }
  }
}
module "image" {
  source   = "./image"
  for_each = local.deployment
  image_in = each.value.image

}

module "container" {
  source = "./container"
  # depends_on = [null_resource.dockervol]
  for_each          = local.deployment
  count_in = each.value.container_count
  name_in           = each.key
  image_in          = module.image[each.key].image_out
  int_port_in       = each.value.int
  ext_port_in       = each.value.ext
  container_path_in = each.value.container_path
}
# resource "docker_container" "nodered_container2" {
#   name = "nodered-66bj"
#   image = "docker_image.nodered_image.image_id"
# }



