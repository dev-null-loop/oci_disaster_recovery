variable "tenancy_ocid" {
  description = "(Required) Tenancy OCID"
  type        = string
}

variable "region_this" {
  description = "this DR protection group region"
  type        = string
}

variable "region_that" {
  description = "that DR protection group region"
  type        = string
}

variable "plan_id" {
  description = "(Required) The OCID of the DR plan.  Example: `ocid1.drplan.oc1..uniqueID`"
  type        = string
}

variable "display_name" {
  description = "(Optional) (Updatable) The display name of the DR plan execution.  Example: `Execution - EBS Switchover PHX to IAD` "
  type        = string
  default     = null
}

variable "freeform_tags" {
  description = "(Optional) (Updatable) Simple key-value pair that is applied without any predefined name, type or scope. Exists for cross-compatibility only."
  type        = map(string)
  default     = {}
}

variable "defined_tags" {
  description = "(Optional) (Updatable) Defined tags for this resource. Each key is predefined and scoped to a namespace."
  type        = map(string)
  default     = null
}

variable "are_prechecks_enabled" {
  description = "(Applicable when plan_execution_type=FAILOVER | START_DRILL | STOP_DRILL | SWITCHOVER) A flag indicating whether prechecks should be executed before the plan execution.  Example: `false`"
  type        = bool
  default     = false
}

variable "are_warnings_ignored" {
  description = "(Optional) A flag indicating whether warnings should be ignored during the switchover precheck.  Example: `true`"
  type        = bool
  default     = true
}

variable "plan_execution_type" {
  description = "(Required) The type of the plan execution."
  type        = string
}
