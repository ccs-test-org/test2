### 3. IAM Groups/Users/Roles that do not have permissions boundaries attached

# Scenario 3
##  IAM Groups/Users/Roles that do not have permissions boundaries attached
resource "aws_iam_role" "scenario_3_pass" {
  name                 = "scenario_3_pass"
  assume_role_policy   = data.aws_iam_policy_document.example_trust.json
  permissions_boundary = "arn:aws:iam::${data.aws_caller_identity.current.account_id}:policy/lz/power-user"
}

resource "aws_iam_role" "scenario_3_fail" {
  name               = "scenario_3_fail"
  assume_role_policy = data.aws_iam_policy_document.example_trust.json
}