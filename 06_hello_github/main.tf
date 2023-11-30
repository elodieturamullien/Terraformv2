provider "github" {
    token = "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"
}

resource "github_repository" "mon_repo" {
  name        = var.nom_du_repo
  description = "Créé avec Terraform"
  private     = true
}

variable "nom_du_repo" {
  description = "Nom du dépôt GitHub"
  type        = string
}