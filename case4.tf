### 4. IAM Policy documents that grant access to resources in another account


# Scenario 4
##  IAM Policy documents that grant access to resources in another account
resource "aws_iam_role_policy" "scenario_4_pass" {
  name   = "scenario-4-pass"
  role   = aws_iam_role.example_role.id
  policy = data.aws_iam_policy_document.scenario_4_pass.json
}

data "aws_iam_policy_document" "scenario_4_pass" {
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

resource "aws_iam_role_policy" "scenario_4_fail" {
  name   = "scenario-4-fail"
  role   = aws_iam_role.example_role.id
  policy = data.aws_iam_policy_document.scenario_4_fail.json
}

data "aws_iam_policy_document" "scenario_4_fail" {
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
