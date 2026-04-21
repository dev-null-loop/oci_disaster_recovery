output "id" {
  description = "The OCID of the Automatic DR configuration."
  value       = oci_disaster_recovery_automatic_dr_configuration.this.id
}

output "display_name" {
  description = "The display name of the Automatic DR configuration."
  value       = oci_disaster_recovery_automatic_dr_configuration.this.display_name
}

output "compartment_id" {
  description = "The OCID of the compartment containing the Automatic DR configuration."
  value       = oci_disaster_recovery_automatic_dr_configuration.this.compartment_id
}

output "dr_protection_group_id" {
  description = "The OCID of the DR protection group to which this Automatic DR configuration belongs."
  value       = oci_disaster_recovery_automatic_dr_configuration.this.dr_protection_group_id
}

output "members" {
  description = "The list of members in this Automatic DR configuration."
  value       = oci_disaster_recovery_automatic_dr_configuration.this.members
}

output "state" {
  description = "The current state of the Automatic DR configuration."
  value       = oci_disaster_recovery_automatic_dr_configuration.this.state
}
