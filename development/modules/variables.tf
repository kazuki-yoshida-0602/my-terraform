#-------------------------------
# 変数定義
#-------------------------------

# 共通
variable "env" {}
variable "pj_name" {}

variable "key_pair" {}

# VPC
variable "vpc_cidr_block" {}

# EC2(本体)
variable "app_ami" {}

variable "app_instance_type" {}
variable "app_root_block_volume_type" {}
variable "app_root_block_volume_size" {}
variable "app_display_name" {}

# サブネット
variable "sn_a_cidr_block" {}
