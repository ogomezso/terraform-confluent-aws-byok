# terraform-confluent-aws-byok
Terraform module for Confluent Bring your own Key over AWS

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >=5.0.1 |
| <a name="requirement_confluent"></a> [confluent](#requirement\_confluent) | >=1.42.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >=5.0.1 |
| <a name="provider_confluent"></a> [confluent](#provider\_confluent) | >=1.42.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_kms_alias.aws_key_alias](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/kms_alias) | resource |
| [aws_kms_key.aws_key](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/kms_key) | resource |
| [aws_kms_key_policy.aws_key_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/kms_key_policy) | resource |
| [confluent_byok_key.byok](https://registry.terraform.io/providers/confluentinc/confluent/latest/docs/resources/byok_key) | resource |
| [aws_caller_identity.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity) | data source |
| [aws_iam_policy_document.aws_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_aws_kms_key_alias"></a> [aws\_kms\_key\_alias](#input\_aws\_kms\_key\_alias) | Alias for AWS KMS Managed key | `string` | n/a | yes |
| <a name="input_aws_kms_key_description"></a> [aws\_kms\_key\_description](#input\_aws\_kms\_key\_description) | Description for AWS KMS Managed Key | `string` | n/a | yes |
| <a name="input_aws_region"></a> [aws\_region](#input\_aws\_region) | AWS Region in wich we gonna create the KMS Managed Key | `string` | n/a | yes |
| <a name="input_confluent_cloud_api_key"></a> [confluent\_cloud\_api\_key](#input\_confluent\_cloud\_api\_key) | Confluent Cloud API KEY. export TF\_VAR\_confluent\_cloud\_api\_key="API\_KEY" | `string` | n/a | yes |
| <a name="input_confluent_cloud_api_secret"></a> [confluent\_cloud\_api\_secret](#input\_confluent\_cloud\_api\_secret) | Confluent Cloud API KEY. export TF\_VAR\_confluent\_cloud\_api\_secret="API\_SECRET" | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_byok"></a> [byok](#output\_byok) | n/a |
<!-- END_TF_DOCS -->