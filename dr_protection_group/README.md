# dr_protection_group

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.5.7 |
| <a name="requirement_oci"></a> [oci](#requirement\_oci) | >= 5.40.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_oci"></a> [oci](#provider\_oci) | >= 5.40.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [oci_disaster_recovery_dr_protection_group.this](https://registry.terraform.io/providers/oracle/oci/latest/docs/resources/disaster_recovery_dr_protection_group) | resource |
| [oci_core_boot_volume.this](https://registry.terraform.io/providers/oracle/oci/latest/docs/data-sources/core_boot_volume) | data source |
| [oci_core_instance.this](https://registry.terraform.io/providers/oracle/oci/latest/docs/data-sources/core_instance) | data source |
| [oci_core_volume_group_backups.these](https://registry.terraform.io/providers/oracle/oci/latest/docs/data-sources/core_volume_group_backups) | data source |
| [oci_core_volume_groups.these](https://registry.terraform.io/providers/oracle/oci/latest/docs/data-sources/core_volume_groups) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_association"></a> [association](#input\_association) | (Optional) The details for associating this DR protection group with a peer DR protection group. | <pre>object({<br>    role        = string<br>    peer_name   = optional(string)<br>    peer_region = string<br>  })</pre> | `null` | no |
| <a name="input_bucket"></a> [bucket](#input\_bucket) | (Required) (Updatable) The bucket name inside the object storage namespace.  Example: `operation_logs` | `string` | n/a | yes |
| <a name="input_compartment_id"></a> [compartment\_id](#input\_compartment\_id) | (Required) (Updatable) The OCID of the compartment in which to create the DR protection group.  Example: `ocid1.compartment.oc1..uniqueID` | `string` | n/a | yes |
| <a name="input_defined_tags"></a> [defined\_tags](#input\_defined\_tags) | (Optional) (Updatable) Defined tags for this resource. Each key is predefined and scoped to a namespace. | `map(string)` | `null` | no |
| <a name="input_destination_subnet_ids"></a> [destination\_subnet\_ids](#input\_destination\_subnet\_ids) | n/a | `map(string)` | `{}` | no |
| <a name="input_display_name"></a> [display\_name](#input\_display\_name) | (Required) (Updatable) The display name of the `this` DR protection group.  Example: `EBS PHX Group` | `string` | n/a | yes |
| <a name="input_freeform_tags"></a> [freeform\_tags](#input\_freeform\_tags) | (Optional) (Updatable) Simple key-value pair that is applied without any predefined name, type or scope. Exists for cross-compatibility only. | `map(string)` | `{}` | no |
| <a name="input_member_ids"></a> [member\_ids](#input\_member\_ids) | n/a | `map(string)` | `{}` | no |
| <a name="input_members"></a> [members](#input\_members) | (Optional) (Updatable) A list of this DR protection group members. | <pre>list(object({<br>    destination_availability_domain = optional(string)<br>    destination_load_balancer_name  = optional(string)<br>    is_movable                      = optional(bool)<br>    is_retain_fault_domain          = optional(bool)<br>    is_start_stop_enabled           = optional(bool)<br>    name                            = optional(string)<br>    type                            = optional(string)<br>    vnic_mappings = optional(object({<br>      destination_nsg_id_list                       = optional(list(string))<br>      destination_primary_private_ip_address        = optional(string)<br>      destination_primary_private_ip_hostname_label = optional(string)<br>      destination_subnet_name                       = optional(string)<br>      source_vnic_name                              = optional(string)<br>    }))<br>    export_mappings = optional(object({<br>      destination_mount_target_name = optional(string)<br>      export_name                   = optional(string)<br>    }))<br>  }))</pre> | `[]` | no |
| <a name="input_namespace"></a> [namespace](#input\_namespace) | (Required) (Updatable) The namespace in object storage (Note - this is usually the tenancy name).  Example: `myocitenancy` | `string` | n/a | yes |
| <a name="input_peer_ids"></a> [peer\_ids](#input\_peer\_ids) | n/a | `map(string)` | `{}` | no |
| <a name="input_source_vnic_ids"></a> [source\_vnic\_ids](#input\_source\_vnic\_ids) | n/a | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_id"></a> [id](#output\_id) | n/a |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
