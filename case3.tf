### 3. IAM Groups/Users/Roles that do not have permissions boundaries attached

data "aws_caller_identity" "current2" {}

# Scenario 3
##  IAM Groups/Users/Roles that do not have permissions boundaries attached
resource "aws_iam_role" "scenario_3_pass" {
  name                 = "scenario_3_pass"
  assume_role_policy   = data.aws_iam_policy_document.example_trust.json
  permissions_boundary = aws_iam_policy.policy.arn
  # permissions_boundary = "arn:aws:iam::${data.aws_caller_identity.current2.account_id}:policy/lz/power-user"
  tags = {
    yor_trace = "069fac8a-ae01-4c7a-8cdd-08bf0b345647"
  }
}

resource "aws_iam_role" "scenario_3_fail" {
  name               = "scenario_3_fail"
  assume_role_policy = data.aws_iam_policy_document.example_trust.json
  tags = {
    yor_trace = "8734ad77-76a5-481d-a45d-265b1b86de24"
  }
}


resource "aws_iam_policy" "policy" {
  name        = "test_policy"
  path        = "/"
  description = "My test policy"

  # Terraform's "jsonencode" function converts a
  # Terraform expression result to valid JSON syntax.
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "ec2:Describe*",
        ]
        Effect   = "Allow"
        Resource = "*"
      },
    ]
  })
  tags = {
    yor_trace = "4c697272-661a-4dfe-a11e-6c6a3ee506ff"
  }
}