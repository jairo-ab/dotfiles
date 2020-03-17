#!/usr/bin/env bash

# cores
C1="#cdae9c"
P1="#eee8d5"

# fontes
NORMAL="Source_Code_Pro:Regular:size=7"
PRAG="PragmataProMonoW20-Regular:size=8"

readonly API_URL='https://corona.lmao.ninja'

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

# obtendo dados do Brasil
  json="$(curl --silent "${API_URL}/countries/brazil")"

  if ! json2array "$json"; then
    echo "ERRO: falha ao obter os dados de $API_URL" >&2
    exit 1
  fi

(
echo "^fn($PRAG)^fg($C1)COVID-19^fg()"; echo
echo "^fn($PRAG)^fg($C1)Casos no Brasil^fg()"; echo
echo "^fg($P1)   Número de casosz.............: ${data[cases]}^fg()"
echo "^fg($P1)      Casos registrados hoje.......: ${data[todayCases]}^fg()"
echo "^fg($P1) Número de mortes.............: ${data[deaths]}^fg()"
echo "^fg($P1)   Mortes registradas hoje......: ${data[todayDeaths]}^fg()"
echo "^fg($P1)Pacientes curados............: ${data[recovered]}^fg()"
echo "^fg($P1)        Pacientes em situação crítica: ${data[critical]}^fg()"

) | dzen2 -p -fn "$NORMAL" -x "1100" -y "30" -bg "#202020" -fg "#666666" -l "11" -w "250" -sa "c" -e "onstart=uncollapse;button3=exit"

#Modifique x e y para ajustar a janela...

}

main "$@"