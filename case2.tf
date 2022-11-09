### 2. IAM Policy documents that have the action sts:AssumeRole 
### granted with a resource that specifies a role ARN from another account.

# Scenario 2
## IAM Policy documents that have the action `sts:AssumeRole` granted with a resource that specifies a role ARN from another account.
resource "aws_iam_role_policy" "scenario_2_pass" {
  name   = "scenario-2-pass"
  role   = aws_iam_role.example_role.id
  policy = data.aws_iam_policy_document.scenario_2_pass.json
}

data "aws_iam_policy_document" "scenario_2_pass" {
  statement {
    effect = "Allow"

    actions = [
      "sts:AssumeRole"
    ]

    resources = [
      "arn:aws:iam::${data.aws_caller_identity.current.account_id}:role/cnc-example-dest-role"
    ]
  }
}

resource "aws_iam_role_policy" "scenario_2_fail" {
  name   = "scenario-2-fail"
  role   = aws_iam_role.example_role.id
  policy = data.aws_iam_policy_document.scenario_2_fail.json
}

data "aws_iam_policy_document" "scenario_2_fail" {
  statement {
    effect = "Allow"

    actions = [
      "sts:AssumeRole"
    ]

    resources = [
      "arn:aws:iam::1111222233334444:role/cnc-example-dest-role"
    ]
  }
}

