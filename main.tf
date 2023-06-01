data "aws_caller_identity" "current" {}

resource "aws_kms_key" "aws_key" {
  description = var.aws_kms_key_description
}

resource "aws_kms_alias" "aws_key_alias" {
  name          = "alias/${var.aws_kms_key_alias}"
  target_key_id = aws_kms_key.aws_key.key_id
  depends_on = [
    aws_kms_key.aws_key
  ]
}

resource "confluent_byok_key" "byok" {
  aws {
    key_arn = aws_kms_key.aws_key.arn
  }
  depends_on = [
    aws_kms_alias.aws_key_alias
  ]
}
data "aws_iam_policy_document" "aws_policy" {
  statement {
    sid    = "Allow KMS Use"
    effect = "Allow"
    actions = [
      "kms:Encrypt",
      "kms:Decrypt",
      "kms:ReEncrypt*",
      "kms:GenerateDataKey*",
      "kms:DescribeKey",
      "kms:CreateGrant",
      "kms:ListGrants",
      "kms:RevokeGrant"

    ]
    principals {
      identifiers = confluent_byok_key.byok.aws[0].roles
      type        = "AWS"
    }

    resources = [
      "*"
    ]
  }

  statement {
    sid    = "Enable IAM User Permissions"
    effect = "Allow"
    actions = [
      "*"
    ]
    resources = [
      "*"
    ]
    principals {
      identifiers = [
        "arn:aws:iam::${data.aws_caller_identity.current.account_id}:root",
      ]
      type = "AWS"
    }
  }
}

resource "aws_kms_key_policy" "aws_key_policy" {
  key_id = aws_kms_key.aws_key.id
  policy = data.aws_iam_policy_document.aws_policy.json
}