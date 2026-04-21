variable "display_name" {
  description = "(Required) (Updatable) The display name of the Automatic DR configuration being created.  Example: `Automatic DR Configuration`"
  type        = string
}

variable "dr_protection_group_id" {
  description = "(Required) The OCID of the DR protection group to which this Automatic DR configuration belongs.  Example: `ocid1.drprotectiongroup.oc1..uniqueID`"
  type        = string
}

variable "members" {
  description = "(Required) (Updatable) A list of members for Automatic DR configuration."
  type = list(object({
    member_id                  = string
    member_type                = string
    is_auto_failover_enabled   = optional(bool, false)
    is_auto_switchover_enabled = optional(bool, false)
  }))
}

variable "default_failover_dr_plan_id" {
  description = "(Optional) (Updatable) The unique id of a Failover DR Plan.  Example: `ocid1.drplan.oc1..uniqueID`"
  type        = string
  default     = null
}

variable "default_switchover_dr_plan_id" {
  description = "(Optional) (Updatable) The unique id of a Switchover DR Plan.  Example: `ocid1.drplan.oc1..uniqueID`"
  type        = string
  default     = null
}

variable "defined_tags" {
  description = "(Optional) (Updatable) Defined tags for this resource. Each key is predefined and scoped to a namespace.  Example: `{\"Operations.CostCenter\": \"42\"}`"
  type        = map(string)
  default     = null
}

variable "freeform_tags" {
  description = "(Optional) (Updatable) Simple key-value pair that is applied without any predefined name, type or scope. Exists for cross-compatibility only.  Example: `{\"Department\": \"Finance\"}`"
  type        = map(string)
  default     = {}
}
