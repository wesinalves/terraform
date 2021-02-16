# remove sensible info
variable "compartment_ocid" {}
variable "subnet_ocid" {}
variable "public_key_path" {}

resource "oci_core_instance" "ubuntu_instance" {
    # Required
    availability_domain = data.oci_identity_availability_domains.ads.availability_domains[0].name
    compartment_id = var.compartment_ocid
    shape = "VM.Standard.E2.1"
    source_details {
        source_id = "ocid1.image.oc1.sa-saopaulo-1.aaaaaaaav5a2iaqihnjzd7urhl3b5xwtbypfyw7m2qadpnkg7z32x2kjh45q"
        source_type = "image"
    }

    # Optional
    display_name = "ubuntu-mcom"
    create_vnic_details {
        assign_public_ip = true
        subnet_id = var.subnet_ocid
    }
    metadata = {
        ssh_authorized_keys = file(var.public_key_path)
    } 
    preserve_boot_volume = false
}
