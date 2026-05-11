output "haproxy_public_ip" {

  value = module.haproxy_vm.public_ip
}

output "app_vm_1_private_ip" {

  value = module.app_vm_1.private_ip
}

output "app_vm_2_private_ip" {

  value = module.app_vm_2.private_ip
}

output "app_vm_1_public_ip" {

  value = module.app_vm_1.public_ip
}

output "app_vm_2_public_ip" {

  value = module.app_vm_2.public_ip
}
