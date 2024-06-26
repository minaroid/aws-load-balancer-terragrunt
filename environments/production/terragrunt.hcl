generate "backend" {
  path = "s3-backend.tf"
  if_exists = "overwrite_terragrunt"
  contents = <<EOF
  terraform {
    backend "s3" {
      bucket = "terraform-myapp-bucket-500"
      key    = "production/${path_relative_to_include()}/terraform.tfstate"
      region = "us-east-1"
    }
  }  
  EOF
}


inputs = {
  environment   = "production"
  region        = "us-east-1"
}

