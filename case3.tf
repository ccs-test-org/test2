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
    yor_trace = "3f4bae2d-03d6-46f4-a3eb-80de3e8c026b"
  }
}

resource "aws_iam_role" "scenario_3_fail" {
  name               = "scenario_3_fail"
  assume_role_policy = data.aws_iam_policy_document.example_trust.json
  tags = {
    yor_trace = "7ba4064f-dcb3-4508-854d-65000887c452"
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
    yor_trace = "3bd0a341-ee8b-4936-826c-9e64f1434ce1"
  }
}