alias pip=pip3

export HOMESHICK_DIR=/opt/homebrew/opt/homeshick
source /opt/homebrew/opt/homeshick/homeshick.sh
fpath=(/opt/homebrew/share/zsh/site-functions $fpath)

autoload -Uz compinit && compinit -u

homeshick --quiet refresh

PROMPT='%(?.%F{green}√.%F{red}?%?)%F{grey} %2~ %(!.%F{red}#.%F{yellow}>)%F{grey} '
RPROMPT='%T'

path=("$HOME/.cargo/bin" '/opt/homebrew/bin' '/opt/homebrew/sbin' $path)

#GOLANG
path+=~/go/bin

#Claude
path+=~/.local/bin

#OTIS CLI
alias otis=otis-cli

export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /opt/homebrew/bin/terraform terraform

export GPG_TTY=$(tty)
path+=/opt/homebrew/opt/sqlite/bin
export PATH
