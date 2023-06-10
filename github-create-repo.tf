# Create GitHub terraform repository
# Docs: https://registry.terraform.io/providers/integrations/github/latest/docs

terraform {
  required_providers {
    github = {
      source  = "integrations/github"
      version = "~> 5.0"
    }
  }
}

# Configure the GitHub Provider
provider "github" {
  token = "**********" # GitHub Token
}

# Create GitHub repository
resource "github_repository" "terraform" {
  name        = "terraform"
  description = "bgelov terraform repository"

  visibility = "public"

  # https://github.com/github/choosealicense.com/tree/gh-pages/_licenses
  license_template = "mit"
  # https://registry.terraform.io/providers/integrations/github/latest/docs/resources/repository#gitignore_template
  gitignore_template = "Terraform"

}

resource "github_repository_file" "README" {
  repository          = "terraform"
  branch              = "main"
  file                = "README.md"
  content             = "This repository was created with terraform."
  commit_message      = "Create README.md"
  commit_author       = "bgelov"
  commit_email        = "belov@ymail.com"
  overwrite_on_create = true
}
