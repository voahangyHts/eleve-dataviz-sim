#!/usr/bin/env bash
# Télécharge les données du fil rouge pour un mois donné :
#   - les courses de taxis jaunes de New York (Parquet, ~60 Mo, ~3 millions de lignes)
#   - la table des zones de taxi (CSV)
#   - la météo horaire de New York (CSV, Open-Meteo)
# Utilisation (depuis la racine du projet) :  bash scripts/telecharger_donnees.sh 2025-01
set -euo pipefail

# Se placer à la racine du projet (le dossier au-dessus de scripts/)
cd "$(dirname "$0")/.."

MOIS="${1:-2025-01}"
DEBUT="${MOIS}-01"
FIN=$(date -d "${DEBUT} +1 month -1 day" +%Y-%m-%d)

TLC="https://d37ci6vzurychx.cloudfront.net"
OPENMETEO="https://archive-api.open-meteo.com/v1/archive"
RAW="data/raw"
mkdir -p "$RAW"

# telecharger <adresse> <fichier> : ne retélécharge pas un fichier déjà présent
telecharger () {
  if [ -s "$2" ]; then
    echo "Déjà présent : $2"
  else
    echo "Téléchargement : $2 ..."
    curl -fL --retry 3 "$1" -o "$2.part"
    mv "$2.part" "$2"
  fi
}

telecharger "${TLC}/trip-data/yellow_tripdata_${MOIS}.parquet" "${RAW}/yellow_tripdata_${MOIS}.parquet"
telecharger "${TLC}/misc/taxi_zone_lookup.csv"               "${RAW}/taxi_zone_lookup.csv"
telecharger "${OPENMETEO}?latitude=40.71&longitude=-74.01&start_date=${DEBUT}&end_date=${FIN}&hourly=temperature_2m,precipitation&timezone=America%2FNew_York&format=csv" \
            "${RAW}/meteo_nyc_${MOIS}.csv"

echo
echo "Terminé. Contenu de ${RAW} :"
ls -lh "$RAW"
