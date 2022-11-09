### 1. IAM Policy documents that have statements granting any s3 actions 
### that have a * in any of the specified resources for that statement.

resource "aws_s3_bucket" "ccs_case1" {
  bucket = "ccs_case1"
  tags = {
    Name        = "ccs_case1"
    Environment = "testing"
    Owner       = "tplisson"
  }
}

resource "aws_s3_bucket_acl" "ccs_case1" {
  bucket = aws_s3_bucket.ccs_case1.id
  acl    = "private"
}

### IAM Policy document with FAILING statements

resource "aws_s3_bucket_policy" "ccs_case1_fail" {
  bucket = aws_s3_bucket.ccs_case1.id
  policy = data.aws_iam_policy_document.ccs_case1_fail.json
}

data "aws_iam_policy_document" "ccs_case1_fail" {
  statement {
    sid = "1"
    actions = [
      "s3:ListAllMyBuckets",
      "s3:GetBucketLocation",
    ]
    resources = [
      "arn:aws:s3:::*", ### THIS IS A FAIL
    ]
  }
  statement {
    actions = [
      "s3:ListBucket",
    ]
    resources = [
      "arn:aws:s3:::ccs_case1",
    ]
    condition {
      test     = "StringLike"
      variable = "s3:prefix"
      values = [
        "",
        "home/",
        "home/&{aws:username}/",
      ]
    }
  }
  statement {
    actions = [
      "s3:*",
    ]
    resources = [
      "arn:aws:s3:::ccs_case1/home/&{aws:username}",
      "arn:aws:s3:::ccs_case1/home/&{aws:username}/*", ### THIS IS A FAIL
    ]
  }
}

### IAM Policy document with PASSING statements
resource "aws_s3_bucket_policy" "ccs_case1_pass" {
  bucket = aws_s3_bucket.ccs_case1.id
  policy = data.aws_iam_policy_document.ccs_case1_pass.json
}

data "aws_iam_policy_document" "ccs_case1_pass" {
  statement {
    sid = "1"
    actions = [
      "s3:ListBucket",
      "s3:ListAllMyBuckets",
      "s3:GetBucketLocation",
    ]
    resources = [
      "arn:aws:s3:::ccs_case1", ### THIS IS A PASS
    ]
  }
  statement {
    actions = [
      "s3:*",
    ]
    resources = [
      "arn:aws:s3:::ccs_case1/home/&{aws:username}", ### THIS IS A PASS
    ]
  }
}
