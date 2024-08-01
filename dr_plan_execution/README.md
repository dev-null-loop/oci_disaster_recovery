## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.5.7 |
| <a name="requirement_oci"></a> [oci](#requirement\_oci) | >= 6.4.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_oci.that"></a> [oci.that](#provider\_oci.that) | >= 6.4.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [oci_disaster_recovery_dr_plan_execution.this](https://registry.terraform.io/providers/oracle/oci/latest/docs/resources/disaster_recovery_dr_plan_execution) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_are_prechecks_enabled"></a> [are\_prechecks\_enabled](#input\_are\_prechecks\_enabled) | (Applicable when plan\_execution\_type=FAILOVER \| START\_DRILL \| STOP\_DRILL \| SWITCHOVER) A flag indicating whether prechecks should be executed before the plan execution.  Example: `false` | `bool` | `false` | no |
| <a name="input_are_warnings_ignored"></a> [are\_warnings\_ignored](#input\_are\_warnings\_ignored) | (Optional) A flag indicating whether warnings should be ignored during the switchover precheck.  Example: `true` | `bool` | `true` | no |
| <a name="input_defined_tags"></a> [defined\_tags](#input\_defined\_tags) | (Optional) (Updatable) Defined tags for this resource. Each key is predefined and scoped to a namespace. | `map(string)` | `null` | no |
| <a name="input_display_name"></a> [display\_name](#input\_display\_name) | (Optional) (Updatable) The display name of the DR plan execution.  Example: `Execution - EBS Switchover PHX to IAD` | `string` | `null` | no |
| <a name="input_freeform_tags"></a> [freeform\_tags](#input\_freeform\_tags) | (Optional) (Updatable) Simple key-value pair that is applied without any predefined name, type or scope. Exists for cross-compatibility only. | `map(string)` | `{}` | no |
| <a name="input_plan_execution_type"></a> [plan\_execution\_type](#input\_plan\_execution\_type) | (Required) The type of the plan execution. | `string` | n/a | yes |
| <a name="input_plan_id"></a> [plan\_id](#input\_plan\_id) | (Required) The OCID of the DR plan.  Example: `ocid1.drplan.oc1..uniqueID` | `string` | n/a | yes |
| <a name="input_region_that"></a> [region\_that](#input\_region\_that) | that DR protection group region | `string` | n/a | yes |
| <a name="input_region_this"></a> [region\_this](#input\_region\_this) | this DR protection group region | `string` | n/a | yes |
| <a name="input_tenancy_ocid"></a> [tenancy\_ocid](#input\_tenancy\_ocid) | (Required) Tenancy OCID | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_id"></a> [id](#output\_id) | The OCID of the DR plan execution.  Example: `ocid1.drplanexecution.oc1..uniqueID` |
