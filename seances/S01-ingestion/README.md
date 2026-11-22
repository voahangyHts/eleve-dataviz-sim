# Séance S01 — Découvrir les données avec PySpark

1. `git pull upstream main`
2. `bash scripts/telecharger_donnees.sh 2025-01` (une seule fois, ~60 Mo)
3. `docker compose up -d`
4. `mkdir -p mon_travail/S01` puis `cp -n seances/S01-ingestion/*.ipynb mon_travail/S01/`
5. Ouvrir `mon_travail/S01/01a_decouvrir_pyspark.ipynb`, brancher le kernel Jupyter, faire les exercices
6. `git add mon_travail`, `git commit`, `git push`, puis `docker compose stop`
