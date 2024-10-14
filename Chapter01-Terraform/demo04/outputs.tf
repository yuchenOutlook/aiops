output "public_ip" {
  value = tencentcloud_instance.web[0].public_ip
}

output "kube_config" {
    value = "${path.module}/config.yaml"
}

output "password" {
    description = "ssh password for the CVM instance"
    value = var.password
}