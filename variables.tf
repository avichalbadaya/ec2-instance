variable "atlas" {
  description = "(Required) Details about this Atlas environment"
  type        = "map"

  default = {
    # the Atlas organization for this environment (ex.MDL)
    org = "local"

    # the Atlas environment name (ex., vpn)
    env = "local"

    # the billing charge code for this environment
    charge_code = "ZZZ-000"

    # the Atlas token to use for Consul server registration
    scada_token = ""
  }
}

variable "aws" {
  description = "(Required) Details about this AWS account"
  type        = "map"

  default = {
    # the AWS account for this environment, used for VPC peering and IAM permissions
    account_id = ""

    # IAM credentials for the account, optional if the env vars
    # AWS_ACCESS_KEY_ID and AWS_SECRET_ACCESS_KEY are present
    access_key = ""

    secret_key = ""

    # the region for this environment
    region = "us-east-1"

    # (DEPRECATED) override the name of the AWS keypair to use for EC2 instances
    key_pair_name = ""
  }
}

variable "instance" {
  description = "(Required) Details about this AWS account"
  type        = "map"

  default = {
    ami_id = ""
    cidr = ""
    subnet_id = ""
    type = ""
  }
}
