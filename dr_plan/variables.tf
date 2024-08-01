variable "tenancy_ocid" {
  description = "(Required) Tenancy OCID"
  type        = string
}

variable "region_this" {
  description = "(Required) this DR protection group region"
  type        = string
}

variable "region_that" {
  description = "(Required) that DR protection group region"
  type        = string
}

variable "display_name" {
  description = "(Required) (Updatable) The display name of the DR plan being created.  Example: `EBS Switchover PHX to IAD`"
  type        = string
}

variable "dr_protection_group_id" {
  description = "(Required) The OCID of the DR protection group to which this DR plan belongs.  Example: `ocid1.drprotectiongroup.oc1..uniqueID` "
  type        = string
}

variable "type" {
  description = "(Required) The type of DR plan to be created."
  type        = string
  validation {
    condition     = contains(["SWITCHOVER", "FAILOVER", "START_DRILL", "STOP_DRILL"], var.type)
    error_message = "Error: unsupported enum value for Type: dr_plan. Supported values are: SWITCHOVER,FAILOVER,START_DRILL,STOP_DRILL."
  }
}

variable "defined_tags" {
  description = "(Optional) (Updatable) Defined tags for this resource. Each key is predefined and scoped to a namespace."
  type        = map(string)
  default     = null
}

variable "freeform_tags" {
  description = "(Optional) (Updatable) Simple key-value pair that is applied without any predefined name, type or scope. Exists for cross-compatibility only."
  type        = map(string)
  default     = {}
}
