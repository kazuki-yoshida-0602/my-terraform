provider "aws" {
  region  = "ap-northeast-1"
  profile = "first-dev"
}

terraform {
  required_version = ">= 0.11.5"

  backend "s3" {
    bucket  = "first-dev-tf"
    key     = "development.tfstaten"
    region  = "ap-northeast-1"
    profile = "first-dev"
  }
}

# ------------------------------
# 開発環境を構築
#-------------------------------
module "development" {
  source = "./modules"

  # 共通
  pj_name  = "first-dev"
  env      = "development"
  key_pair = "ec2key-first-dev"

  # VPC
  vpc_cidr_block = "172.30.0.0/16"

  # EC2(本体)
  app_ami                    = "ami-c2680fa4"
  app_instance_type          = "t2.micro"
  app_root_block_volume_type = "gp2"
  app_root_block_volume_size = "16"
  app_display_name           = "first-dev開発サーバ"

  # サブネット
  sn_a_cidr_block = "172.30.0.0/24"
}
