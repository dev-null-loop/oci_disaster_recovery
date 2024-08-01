variable "compartment_id" {
  description = "(Required) (Updatable) The OCID of the compartment in which to create the DR protection group.  Example: `ocid1.compartment.oc1..uniqueID`"
  type        = string
}

variable "defined_tags" {
  description = "(Optional) (Updatable) Defined tags for this resource. Each key is predefined and scoped to a namespace."
  type        = map(string)
  default     = null
}

variable "display_name" {
  description = "(Required) (Updatable) The display name of the `this` DR protection group.  Example: `EBS PHX Group`"
  type        = string
}

variable "freeform_tags" {
  description = "(Optional) (Updatable) Simple key-value pair that is applied without any predefined name, type or scope. Exists for cross-compatibility only."
  type        = map(string)
  default     = {}
}

variable "bucket" {
  description = "(Required) (Updatable) The bucket name inside the object storage namespace.  Example: `operation_logs`"
  type        = string
}

variable "namespace" {
  description = "(Required) (Updatable) The namespace in object storage (Note - this is usually the tenancy name).  Example: `myocitenancy`"
  type        = string
}

# variable "disassociate_trigger" {
#   description = "(Optional) (Updatable) An optional property when incremented triggers Disassociate. Could be set to any integer value."
#   type        = number
# }

variable "association" {
  description = "(Optional) The details for associating this DR protection group with a peer DR protection group."
  type = object({
    role        = string
    peer_name   = optional(string)
    peer_region = string
  })
  default = null
}

variable "members" {
  description = "(Optional) (Updatable) A list of this DR protection group members."
  type = list(object({
    destination_availability_domain = optional(string)
    destination_load_balancer_name  = optional(string)
    is_movable                      = optional(bool)
    is_retain_fault_domain          = optional(bool)
    is_start_stop_enabled           = optional(bool)
    name                            = optional(string)
    type                            = optional(string)
    vnic_mappings = optional(object({
      destination_nsg_id_list                       = optional(list(string))
      destination_primary_private_ip_address        = optional(string)
      destination_primary_private_ip_hostname_label = optional(string)
      destination_subnet_name                       = optional(string)
      source_vnic_name                              = optional(string)
    }))
    export_mappings = optional(object({
      destination_mount_target_name = optional(string)
      export_name                   = optional(string)
    }))
  }))

  default = []
}

variable "member_ids" {
  type    = map(string)
  default = {}
}

variable "peer_ids" {
  type    = map(string)
  default = {}
}

variable "destination_subnet_ids" {
  type    = map(string)
  default = {}
}

variable "source_vnic_ids" {
  type    = map(string)
  default = {}
}
