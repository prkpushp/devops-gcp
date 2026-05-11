output "haproxy_public_ip" {
  value = module.haproxy_vm.instance_public_ip
}

output "app_vm_1_private_ip" {
  value = module.app_vm_1.instance_private_ip
}

output "app_vm_2_private_ip" {
  value = module.app_vm_2.instance_private_ip
}

output "app_vm_1_public_ip" {
  value = module.app_vm_1.instance_public_ip
}

output "app_vm_2_public_ip" {
  value = module.app_vm_2.instance_public_ip
}
