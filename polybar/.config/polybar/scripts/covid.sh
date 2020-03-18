#!/usr/bin/env bash
# covid.sh
##########
#
# Imprime números a respeito do COVID-19 (doença causada pelo Coronavirus).
#

readonly API_URL='https://corona.lmao.ninja'
# deixando claro que data é um array associativo
declare -A data

json2array() {
  local jsonData="$1"

  # verificando se é um JSON válido
  jq empty <<<"$jsonData" 2>/dev/null || return 1

  while IFS== read -r key value; do
    data[$key]="$value"
  done < <(jq -r '. | to_entries | .[] | .key + "=" + (.value|tostring)' <<<"$jsonData")
}

main() {
  local json
  
  # primeiro dados globais:
  json="$(curl --silent "${API_URL}/all")"

  if ! json2array "$json"; then
    echo "ERRO: falha ao obter os dados de $API_URL" >&2
    exit 1
  fi

  # obtendo dados do Brasil
  json="$(curl --silent "${API_URL}/countries/brazil")"

  if ! json2array "$json"; then
    echo "ERRO: falha ao obter os dados de $API_URL" >&2
    exit 1
  fi

  echo -n "
Dados Referentes ao Brasil
^^^^^^^^^^^^^^^^^^^^^^^^^^
Número de casos..............: ${data[cases]}
Casos registrados hoje.......: ${data[todayCases]}
Número de mortes.............: ${data[deaths]}
Mortes registradas hoje......: ${data[todayDeaths]}
Pacientes curados............: ${data[recovered]}
Pacientes em situação crítica: ${data[critical]}
"
}

main "$@"
