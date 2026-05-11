output "load_balancer_ip" {
  value = module.loadbalancer.lb_ip
}

output "instance_group" {
  value = module.mig.instance_group
}
