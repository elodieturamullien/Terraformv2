#Création nouveau dépot avec python

import subprocess
import sys

#Création repository git

def create_github_repository(repo_name):
    subprocess.run(["terraform", "apply", "-auto-approve", "-var", f"nom_du_repo={repo_name}"])

if __name__ == "__main__":
    repo_name = sys.argv[1]
    create_github_repository(repo_name)
    print(f"Le dépôt GitHub '{repo_name}' est créé.")