### ALIAS ###
alias tml='tmuxp load'

### PATH ###
export ZSH="$HOME/.oh-my-zsh"
export TMUXP_CONFIGDIR=$HOME/.tmux/layouts/

### SETTINGS ###
ZSH_THEME="bira"
export DISABLE_AUTO_TITLE='true'

### PLUGINS ###
plugins=(git zsh-autosuggestions)
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $(brew --prefix)/share/zsh-you-should-use/you-should-use.plugin.zsh

# Load Oh My Zsh
source $ZSH/oh-my-zsh.sh

HIST_STAMPS="mm/dd/yyyy"

### SETTINGS VIM MODE ###
bindkey -v
export KEYTIMEOUT=10 
bindkey -M viins 'jk' vi-cmd-mode

### CHANGE THE CURSOR SHAPE BASED ON THE KEYMAP ###
function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]] || [[ $1 = 'block' ]]; then
    echo -ne '\e[1 q'  # Solid (normal/visual mode)
  elif [[ ${KEYMAP} == main ]] || [[ ${KEYMAP} == viins ]] || [[ ${KEYMAP} = '' ]] || [[ $1 = 'beam' ]]; then
    echo -ne '\e[5 q'  # Blinking (insert mode)
  fi
}
zle -N zle-keymap-select

# Set the initial cursor shape to blinking
echo -ne '\e[5 q'
# Set the cursor shape when entering vi mode
precmd() { echo -ne '\e[5 q' ; }

eval "$(starship init zsh)"
