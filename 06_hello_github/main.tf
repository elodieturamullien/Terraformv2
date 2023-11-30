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