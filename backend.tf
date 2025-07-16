terraform {
  required_providers {
    atlas = {
      source  = "ariga/atlas"
      version = "~> 0.9.8"
    }
  }
  backend "s3" {}
}