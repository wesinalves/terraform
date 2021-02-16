# Outputs for compute instance
output "public-ip-for-compute-instance" {
  value = oci_core_instance.ubuntu_instance.public_ip
}

output "instance-shape" {
  value = oci_core_instance.ubuntu_instance.shape
}

output "instance-OCPUs" {
  value = oci_core_instance.ubuntu_instance.shape_config[0].ocpus
}

output "instance-memory-in-GBs" {
  value = oci_core_instance.ubuntu_instance.shape_config[0].memory_in_gbs
}