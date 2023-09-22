# output "ip-address" {
#   value       = [for i in docker_container.nodered_container[*] : join(":", i.network_data[*].ip_address, i.ports[*].external)]
#   description = "The IP address and port of the container 2"
# }
# # output "ip-address2" {
# #   value = join(":",[docker_container.nodered_container[0].network_data[0].ip_address, docker_container.nodered_container[0].ports[0].external])
# #   description = "The ip address and port of container 1"
# # }
# output "container-name" {
#   value       = docker_container.nodered_container.name
#   description = "The name of the container "
# }

output "application_access" {
    value = {for x in docker_container.app_container[*] : x.name => join(":",[x.network_data[0].ip_address,x.ports[0]["external"]])}
}