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

# *ISSUE* data.oci_disaster_recovery_dr_protection_group DOES NOT DETECT DELETED drpgs
# data.oci_disaster_recovery_dr_protection_group.this: Read complete after 1s [id=ocid1.drprotectiongroup.oc1.eu-amsterdam-1.aaaaaaaanfdw4ic2ln7lnns5j4baj6xjcbgubweu5z44wplft46dw53w4wrq]
# │ Error: Resource precondition failed
# │   on main.tf line 20, in resource "oci_disaster_recovery_dr_plan" "this":
# │   20:       condition     = contains(["STANDBY"], local.role)
# │     ├────────────────
# │     │ local.role is "UNCONFIGURED"
# │ Error: DR Protection Group ocid1.drprotectiongroup.oc1.eu-amsterdam-1.aaaaaaaanfdw4ic2ln7lnns5j4baj6xjcbgubweu5z44wplft46dw53w4wrq does not have a STANDBY role.
