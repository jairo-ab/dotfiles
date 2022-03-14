# mpv
function mm() {
	params=\"$@\"
	killall mpv 1> /dev/null 2> /dev/null
	sleep 1
#(mpv --really-quiet --profile=youtube-cache ytdl://ytsearch:"$params") > /dev/null 2> /dev/null &
 (mpv --ytdl-format="bestvideo[height<=?1080][vcodec!=vp9]+bestaudio/best"  ytdl://ytsearch:"$params") > /dev/null 2> /dev/null &
}

function mma() {
 #mpv --ytdl-format=bestaudio ytdl://ytsearch:"$@" # ytdl://ytsearch10:"$@"
 mpv --no-video --ytdl-format=bestaudio ytdl://ytsearch:"$@"
}

function projects() {
  kitty --session ~/.config/kitty/statup.conf
}

export LESS='-F -R -J -M -W -X'
export LESSHISTFILE=/dev/null
export LESS_TERMCAP_mb=$'\e[1;31m'
export LESS_TERMCAP_md=$'\e[1;36m'
export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_so=$'\e[02;44;30m'
export LESS_TERMCAP_se=$'\e[0m'
export LESS_TERMCAP_us=$'\e[1;32m'
export LESS_TERMCAP_ue=$'\e[0m'

function ls {
  export COLUMNS
  command ls -AC --color=always --group-directories-first "$@" | less
}
