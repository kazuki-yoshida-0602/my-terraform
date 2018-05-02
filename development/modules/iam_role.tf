#-------------------------------
# iamロール/プロフィール
#-------------------------------

resource "aws_iam_instance_profile" "ec2_profile" {
  name = "${var.pj_name}_${var.env}_ec2_iam_role_profile"
  role = "${aws_iam_role.ec2_role.name}"
}

# EC2の読み込みのみ可能なポリシーの作成
resource "aws_iam_role_policy" "ec2_read_only_policy" {
  name = "ec2_read_only_policy"
  role = "${aws_iam_role.ec2_role.id}"

  policy = <<EOF
{
	"Version": "2012-10-17",
	"Statement": [
		{
			"Effect": "Allow",
			"Action": "ec2:Describe*",
			"Resource": "*"
		},
		{
			"Effect": "Allow",
			"Action": "elasticloadbalancing:Describe*",
			"Resource": "*"
		},
		{
			"Effect": "Allow",
			"Action": [
				"cloudwatch:ListMetrics",
				"cloudwatch:GetMetricStatistics",
				"cloudwatch:Describe*"
			],
			"Resource": "*"
		},
		{
			"Effect": "Allow",
			"Action": "autoscaling:Describe*",
			"Resource": "*"
		}
	]
}
EOF
}

# S3のフルアクセスのポリシー
resource "aws_iam_role_policy" "s3_fullaccess_policy" {
  name = "s3_fullaccess_policy"
  role = "${aws_iam_role.ec2_role.id}"

  policy = <<EOF
{
	"Version": "2012-10-17",
	"Statement": [
		{
			"Effect": "Allow",
			"Action": "s3:*",
			"Resource": "*"
		}
	]
}
EOF
}

resource "aws_iam_role" "ec2_role" {
  name = "${var.env}_ec2_iam_role"
  path = "/"

  assume_role_policy = <<EOF
{
	"Version": "2012-10-17",
	"Statement": [
		{
			"Sid": "",
			"Effect": "Allow",
			"Principal": {
				"Service": "ec2.amazonaws.com"
			},
			"Action": "sts:AssumeRole"
		}
	]
}
EOF
}
