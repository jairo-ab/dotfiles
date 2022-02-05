#!/usr/bin/env bash

# cores
C1="#cdae9c"
P1="#eee8d5"
AL="#BF616A"

# fontes
NORMAL="Source_Code_Pro:Regular:size=7"
PRAG="PragmataProMonoW20-Regular:size=8"
FontAwesome="^fn(FontAwesome)"

# icon 
time_icon="^i($HOME/.config/dzen2/clock.xbm)"
note_icon="^i($HOME/.config/dzen2/note.xbm)"
info_icon="^i($HOME/.config/dzen2/info.xbm)"
info2_icon="^i($HOME/.config/dzen2/info2.xbm)"
info3_icon="^i($HOME/.config/dzen2/info3.xbm)"

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
echo "^fn($PRAG)^fg($C1)${info_icon} COVID-19^fg()"; echo
echo "^fn($PRAG)^fg($C1)Casos no Brasil^fg()"; echo
#echo "$( date -d @$((data[update] / 1000)) )";
echo "^fg($P1)${info3_icon} Número de casos...................: ^fg()^fg($AL)${data[cases]}^fg()"
echo "^fg($P1)${info3_icon} Casos registrados hoje.............: ^fg()^fg($AL)${data[todayCases]}^fg()"
echo "^fg($P1)${info3_icon} Número de mortes....................: ^fg()^fg($AL)${data[deaths]}^fg()"
echo "^fg($P1)${info3_icon} Mortes registradas hoje...........: ^fg()^fg($AL)${data[todayDeaths]}^fg()"
echo "^fg($P1)${info3_icon} Pacientes curados....................: ^fg()^fg($AL)${data[recovered]}^fg()"
echo "^fg($P1)${info3_icon} Pacientes em situação crítica: ^fg()^fg($AL)${data[critical]}^fg()"

) | dzen2 -p -fn "$NORMAL" -x "1100" -y "30" -bg "#26282D" -fg "#666666" -l "11" -w "250" -sa "c" -e "onstart=uncollapse;button3=exit"

#Modifique x e y para ajustar a janela...

}

main "$@"