# Confluent Cloud Credentials  

variable "confluent_cloud_api_key" {
  type        = string
  description = "Confluent Cloud API KEY. export TF_VAR_confluent_cloud_api_key=\"API_KEY\""
}

variable "confluent_cloud_api_secret" {
  type        = string
  description = "Confluent Cloud API KEY. export TF_VAR_confluent_cloud_api_secret=\"API_SECRET\""
}

# AWS 

variable "aws_region" {
    type = string
    description = "AWS Region in wich we gonna create the KMS Managed Key"
}

variable "aws_kms_key_alias" {
   type = string
   description = "Alias for AWS KMS Managed key"
}

variable "aws_kms_key_description" {
    type = string
    description = "Description for AWS KMS Managed Key"
}