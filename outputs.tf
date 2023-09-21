# output "ip-address" {
#   value       = flatten(module.container[*].ip-address)
#   description = "The IP address and port of the container 2"
# }
# # output "ip-address2" {
# #   value = join(":",[docker_container.nodered_container[0].network_data[0].ip_address, docker_container.nodered_container[0].ports[0].external])
# #   description = "The ip address and port of container 1"
# # }
# output "container-name" {
#   //con module.container accedemos a las outputs de ese modulo. Tiene un splatt porque nos entrega una lista
#   //dado que la variable se llama container-name, la accedemos
#   value       = module.container[*].container-name
#   description = "The name of the container "
# }

