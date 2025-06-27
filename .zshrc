export ZSH="$HOME/.oh-my-zsh"
export HISTORY_IGNORE="(ls|cd|pwd|exit|sudo reboot|history|cd -|cd ..)"
export BROWSER="firefox"
export EDITOR="nano"

# Command auto-correction.
ENABLE_CORRECTION="true"

# Display red dots whilst waiting for completion
COMPLETION_WAITING_DOTS="true"

# Theme
ZSH_THEME="jispwoso"
export CATPPUCCIN_FLAVOUR="mocha"

if [ -f "$HOME/.config/themes/colors.sh" ]; then
  source "$HOME/.config/themes/colors.sh"
fi

COLOR_BLUE="{${COLOR_BLUE:-blue}}"
COLOR_MAGENTA="{${COLOR_MAUVE:-magenta}}"
COLOR_RED="{${COLOR_RED:-red}}"
COLOR_YELLOW="{${COLOR_YELLOW:-yellow}}"
COLOR_GREY="{${COLOR_SURFACE_2:-grey}}"
COLOR_CYAN="{${COLOR_SAPPHIRE:-cyan}}"
COLOR_ORANGE="{${COLOR_PEACH:-orange}}"
COLOR_GREEN="{${COLOR_GREEN:-green}}"

# Change oh-my-zsh'a auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time
# zstyle ':omz:update' frequency 13

# Plugins
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
plugins=(bun git nvm zsh-autosuggestions)

if [ -f "/usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh" ]; then
 source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh
fi

if [ -f "/usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" ]; then
  source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi

ZSH_HIGHLIGHT_STYLES[default]="none"

# nvm plugin settings
zstyle ':omz:plugins:nvm' silent-autoload yes

# Aliases
alias cls="clear"
alias ls="ls --color"

# Functions
extract() {
  if [ -f $1 ]; then
    case $1 in
      *.tar.bz2) tar xvjf $1   ;;
      *.tar.gz)  tar xvzf $1   ;;
      *.bz2)     bunzip2 $1    ;;
      *.rar)     unrar x $1    ;;
      *.gz)      gunzip $1     ;;
      *.tar)     tar xvf $1    ;;
      *.tbz2)    tar xvjf $1   ;;
      *.tgz)     tar xvzf $1   ;;
      *.zip)     unzip $1      ;;
      *.Z)       uncompress $1 ;;
      *.7z)      7z x $1       ;;
      *)         echo "Unsupported file type: '$1'..." ;;
    esac
  else
    echo "'$1' is not a valid file!"
  fi
}

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# Composer CLI
export PATH="/home/morten/.config/composer/vendor/bin/":$PATH

source $ZSH/oh-my-zsh.sh
