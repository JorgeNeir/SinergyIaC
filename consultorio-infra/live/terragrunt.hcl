remote_state {
  backend = "s3"
  generate = {
    path      = "backend.tf"
    if_exists = "overwrite_terragrunt"
  }
  config = {
    bucket         = "sinergy-infra-state-${get_aws_account_id()}"
    key            = "${path_relative_to_include()}/terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
    dynamodb_table = "sinergy-lock-table"
  }
}

inputs = {
  aws_region = "us-east-1"
  project    = "sinergy-consultorio"
  owner      = "JorgeNeir"
}