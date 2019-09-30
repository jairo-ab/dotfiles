export TERM='xterm-256color'

# Path to your oh-my-zsh installation.
export ZSH="/home/jairo/.oh-my-zsh"

ZSH_THEME="powerlevel9k/powerlevel9k"
POWERLEVEL9K_MODE="nerdfont-complete"

# Cores do Powerline

    POWERLEVEL9K_DIR_SHOW_WRITABLE=true
    POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(context dir vcs )
    POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status ssh root_indicator background_jobs virtualenv)
    POWERLEVEL9K_DIR_SHOW_WRITABLE=true
    POWERLEVEL9K_SHORTEN_DIR_LENGTH=1
    POWERLEVEL9K_CONTEXT_TEMPLATE="%n"
    POWERLEVEL9K_SHORTEN_DELIMITER=""
    POWERLEVEL9K_SHORTEN_STRATEGY="truncate_from_right"
    POWERLEVEL9K_STATUS_OK=false
    POWERLEVEL9K_TIME_FOREGROUND=
    POWERLEVEL9K_TIME_BACKGROUND=


POWERLEVEL9K_TIME_FORMAT="%T"

# Lado Esquerdo
#POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(os_icon context vcs dir)

# Lado Direito
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(time)

# Which plugins would you like to load?
plugins=(git)

source $ZSH/oh-my-zsh.sh


source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

