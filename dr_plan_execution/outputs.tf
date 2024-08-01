output "id" {
  description = "The OCID of the DR plan execution.  Example: `ocid1.drplanexecution.oc1..uniqueID`"
  value       = oci_disaster_recovery_dr_plan_execution.this.id
}
