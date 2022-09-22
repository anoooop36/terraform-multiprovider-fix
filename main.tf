provider "vault" {
  address = "http://10.198.1.72"
}

data "vault_dummy_aws_credentials" "secret"{
  backend = "aws"
  role = "admin_dummy"
}

provider "aws" {
  access_key          = "${var.access_key}"
  secret_key          = "${var.secret_key}"
  allowed_account_ids = ["${var.first_account_id}"]
  region              = "${var.region}"
}

variable "access_key" {}
variable "secret_key" {}
variable "first_account_id" {
  type  = string
}

variable "region" {
  type  = string
}

resource "aws_s3_bucket" "shub1_test_bucket" {
  bucket = "sp2-shub1-new-test-bucket"
}
