#!/bin/sh

TMP="/tmp/$(date +"%Y-%m-%d_%H:%M:%S").png"
PIC="$HOME/Imagens/shots/$(date +"%Y-%m-%d_%H:%M:%S").png"

sr(){
	maim -u -m 10 "$PIC"
	notify-send -u low -i "$PIC" "Print" "Saved in ~/Imagens"
}

sa(){
	maim -u -m 10 -s "$PIC"
	notify-send -u low -i "$PIC" "Print" "Area saved in ~/Imagens"
}

cr(){
	maim -u -m 10 "$TMP"
	xclip -selection c -t image/png "$TMP"
	notify-send -u low -i "$TMP" "Print" "Copied to clipboard"
}

ca(){
	maim -u -m 10 -s "$TMP"
	xclip -selection c -t image/png "$TMP"
	notify-send -u low -i "$TMP" "Print" "Area copied to clipboard"
}

ur(){
	maim -u -m 10 "$TMP"
	curl -F file=@$TMP http://0x0.st | xclip -selection c -i
	notify-send -u low -i "$TMP" "Print" "Uploaded and url copied"
}

ua(){
	maim -u -m 10 -s "$TMP"
	curl -F file=@$TMP http://0x0.st | xclip -selection c -i
	notify-send -u low -i "$TMP" "Print" "Area uploaded and url copied"
}

fun=$(echo $@ | sed "s/-\| //g")
$fun
