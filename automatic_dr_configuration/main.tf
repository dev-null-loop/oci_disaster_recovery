resource "oci_disaster_recovery_automatic_dr_configuration" "this" {
  display_name           = var.display_name
  dr_protection_group_id = var.dr_protection_group_id
  dynamic "members" {
    for_each = var.members
    iterator = me
    content {
      member_id                  = me.value.member_id
      member_type                = me.value.member_type
      is_auto_failover_enabled   = me.value.is_auto_failover_enabled
      is_auto_switchover_enabled = me.value.is_auto_switchover_enabled
    }
  }
  default_failover_dr_plan_id   = var.default_failover_dr_plan_id
  default_switchover_dr_plan_id = var.default_switchover_dr_plan_id
  defined_tags                  = var.defined_tags
  freeform_tags                 = var.freeform_tags
}
