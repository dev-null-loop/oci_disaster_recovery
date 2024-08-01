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
| [oci_disaster_recovery_dr_plan.this](https://registry.terraform.io/providers/oracle/oci/latest/docs/resources/disaster_recovery_dr_plan) | resource |
| [oci_disaster_recovery_dr_protection_group.this](https://registry.terraform.io/providers/oracle/oci/latest/docs/data-sources/disaster_recovery_dr_protection_group) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_defined_tags"></a> [defined\_tags](#input\_defined\_tags) | (Optional) (Updatable) Defined tags for this resource. Each key is predefined and scoped to a namespace. | `map(string)` | `null` | no |
| <a name="input_display_name"></a> [display\_name](#input\_display\_name) | (Required) (Updatable) The display name of the DR plan being created.  Example: `EBS Switchover PHX to IAD` | `string` | n/a | yes |
| <a name="input_dr_protection_group_id"></a> [dr\_protection\_group\_id](#input\_dr\_protection\_group\_id) | (Required) The OCID of the DR protection group to which this DR plan belongs.  Example: `ocid1.drprotectiongroup.oc1..uniqueID` | `string` | n/a | yes |
| <a name="input_freeform_tags"></a> [freeform\_tags](#input\_freeform\_tags) | (Optional) (Updatable) Simple key-value pair that is applied without any predefined name, type or scope. Exists for cross-compatibility only. | `map(string)` | `{}` | no |
| <a name="input_region_that"></a> [region\_that](#input\_region\_that) | (Required) that DR protection group region | `string` | n/a | yes |
| <a name="input_region_this"></a> [region\_this](#input\_region\_this) | (Required) this DR protection group region | `string` | n/a | yes |
| <a name="input_tenancy_ocid"></a> [tenancy\_ocid](#input\_tenancy\_ocid) | (Required) Tenancy OCID | `string` | n/a | yes |
| <a name="input_type"></a> [type](#input\_type) | (Required) The type of DR plan to be created. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_id"></a> [id](#output\_id) | The OCID of the DR plan.  Example: `ocid1.drplan.oc1..uniqueID` |
