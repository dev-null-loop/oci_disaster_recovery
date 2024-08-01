data "oci_core_volume_groups" "these" {
  for_each       = toset(local.vgs)
  compartment_id = var.compartment_id
  display_name   = each.value
  state          = "AVAILABLE"
}

data "oci_core_volume_group_backups" "these" {
  for_each        = toset(local.vgs)
  compartment_id  = var.compartment_id
  volume_group_id = var.member_ids[each.value]

  filter {
    name   = "state"
    values = ["AVAILABLE"]
  }
}

data "oci_core_instance" "this" {
  for_each    = toset(local.vms)
  instance_id = var.member_ids[each.value]
}

data "oci_core_boot_volume" "this" { # => volume_group_id
  for_each       = local.existing_vms
  boot_volume_id = data.oci_core_instance.this[each.value].boot_volume_id
}

locals {
  vgs = (
    var.members != null ?
    [for i in var.members : i.name if i.type == "VOLUME_GROUP"] :
    []
  )
  vms = (
    var.members != null ?
    [for i in var.members : i.name if i.type == "COMPUTE_INSTANCE_MOVABLE"] :
    []
  )
  existing_vms = toset([for i in local.vms : i if data.oci_core_instance.this[i].state != "TERMINATED"])

  vg_backups_and_replicas = [
    for vg in local.vgs :
    length(data.oci_core_volume_group_backups.these[vg].volume_group_backups) +
    length(data.oci_core_volume_groups.these[vg].volume_groups[0].volume_group_replicas)
  ]

  vm_bootvol_backups_and_replicas = [
    for vm in local.vms :
    length(data.oci_core_boot_volume.this[vm].boot_volume_replicas) +
    (data.oci_core_boot_volume.this[vm].volume_group_id != null ? 1 : 0)
  ]

}

# data "oci_core_volume_groups" "all" {
#   compartment_id = var.compartment_id
#   state          = "AVAILABLE"
# }
