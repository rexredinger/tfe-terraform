provider "tfe" {
  hostname = var.hostname
}

resource "tfe_workspace" "initiald" {
  organization = var.organization
  name = "Initial_D"
}

