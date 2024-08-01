resource "oci_disaster_recovery_dr_protection_group" "this" {
  compartment_id = var.compartment_id
  display_name   = var.display_name
  defined_tags   = var.defined_tags
  freeform_tags  = var.freeform_tags

  log_location {
    bucket    = var.bucket
    namespace = var.namespace
  }

  dynamic "association" {
    for_each = var.association[*]
    content {
      role        = association.value.role
      peer_id     = var.peer_ids[association.value.peer_name]
      peer_region = association.value.peer_region
    }
  }

  dynamic "members" {
    for_each = var.members != null ? var.members : []
    iterator = mbr
    content {
      destination_availability_domain = mbr.value.destination_availability_domain
      destination_load_balancer_id    = mbr.value.destination_load_balancer_name
      is_movable                      = mbr.value.is_movable
      is_retain_fault_domain          = mbr.value.is_retain_fault_domain
      is_start_stop_enabled           = mbr.value.is_start_stop_enabled
      member_id                       = var.member_ids[mbr.value.name]
      member_type                     = mbr.value.type

      dynamic "vnic_mappings" {
        for_each = mbr.value.vnic_mappings[*]
        iterator = vm
        content {
          source_vnic_id                                = var.source_vnic_ids[vm.value.source_vnic_name]
          destination_subnet_id                         = var.destination_subnet_ids[vm.value.destination_subnet_name]
          destination_nsg_id_list                       = vm.value.destination_nsg_id_list
          destination_primary_private_ip_address        = vm.value.destination_primary_private_ip_address
          destination_primary_private_ip_hostname_label = vm.value.destination_primary_private_ip_hostname_label
        }
      }
    }
  }

  lifecycle {
    precondition {
      condition     = !contains(local.vg_backups_and_replicas, 0)
      error_message = "Error: Could not find any cross-region volume group replicas or volume group backups for volume group in DR Protection Group."
    }
    precondition {
      condition     = !contains(local.vm_bootvol_backups_and_replicas, 0)
      error_message = "Error: Instance has a boot volume that does not belong to any volume group."
    }
  }

  provisioner "local-exec" {
    when        = destroy
    interpreter = ["/bin/bash", "-c"]
    command = templatefile("${path.module}/disassociate.tmpl", {
      dr_protection_group_id = self.id
      region                 = replace(self.id, "/(ocid1.drprotectiongroup.oc1.)|(.aaaa.*)/", "")
    })
  }

  timeouts {
    create = "5m"
    delete = "5m"
  }
}
