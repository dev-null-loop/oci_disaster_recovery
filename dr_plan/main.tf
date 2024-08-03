data "oci_disaster_recovery_dr_protection_group" "this" {
  dr_protection_group_id = var.dr_protection_group_id
}

locals {
  role = (
    data.oci_disaster_recovery_dr_protection_group.this.state == "ACTIVE" ?
    data.oci_disaster_recovery_dr_protection_group.this.role :
    "DELETED"
  )
}

resource "oci_disaster_recovery_dr_plan" "this" {
  display_name           = var.display_name
  dr_protection_group_id = var.dr_protection_group_id
  type                   = var.type
  defined_tags           = var.defined_tags
  freeform_tags          = var.freeform_tags

  lifecycle {
    precondition {
      condition     = !contains(["DELETED"], local.role)
      error_message = "Error: ${var.dr_protection_group_id} cannot be used (DELETED)."
    }

    precondition {
      condition     = contains(["STANDBY"], local.role)
      error_message = "Error: ${var.dr_protection_group_id} does not have a STANDBY role."
    }
  }
}
