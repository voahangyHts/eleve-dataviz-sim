# Simulation du cours de dataviz — fil rouge NYC Taxi

Dépôt d'entraînement qui reproduit l'organisation du cours.

## Installation (une seule fois)
1. Forker / cloner, puis ajouter le dépôt du prof : `git remote add upstream <adresse>`
2. Télécharger les données : `bash scripts/telecharger_donnees.sh 2025-01`
3. Lancer les logiciels : `docker compose up -d`, puis vérifier avec `docker compose ps`
4. Dans VS Code : ouvrir un notebook, Select Kernel → Existing Jupyter Server →
   `http://localhost:8888/?token=cours`

## À chaque séance
```bash
git pull upstream main
mkdir -p mon_travail/SXX
cp -n seances/SXX-*/*.ipynb mon_travail/SXX/
# ... travailler ...
git add mon_travail
git commit -m "SXX : ..."
git push
docker compose stop
```
