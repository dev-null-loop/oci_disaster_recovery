resource "oci_disaster_recovery_dr_plan_execution" "this" {
  plan_id       = var.plan_id
  defined_tags  = var.defined_tags
  display_name  = var.display_name
  freeform_tags = var.freeform_tags

  execution_options {
    plan_execution_type   = var.plan_execution_type
    are_prechecks_enabled = var.are_prechecks_enabled
    are_warnings_ignored  = var.are_warnings_ignored
  }
}
