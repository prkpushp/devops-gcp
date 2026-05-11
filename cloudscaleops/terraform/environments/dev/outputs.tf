output "load_balancer_ip" {
  value = module.loadbalancer.lb_ip
}

output "web_instance_group" {
  value = module.web_mig.instance_group
}

output "api_instance_group" {
  value = module.api_mig.instance_group
}
