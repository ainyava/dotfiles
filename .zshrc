export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="bira"
plugins=(git zsh-autosuggestions golang argocd kubectl kube-ps1 ansible helm nmap rust fzf-zsh-plugin)

source $ZSH/oh-my-zsh.sh

export TERM=xterm-256color

# kubectl
export KUBE_EDITOR=nvim
source <(kubectl completion zsh)
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"

# rust
. "$HOME/.cargo/env"

# pyenv
export PATH=$PATH:/home/ainyava/.pyenv/bin
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

# miniconda
[ -f /opt/miniconda3/etc/profile.d/conda.sh ] && source /opt/miniconda3/etc/profile.d/conda.sh

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
[ -s "/home/ainyava/.bun/_bun" ] && source "/home/ainyava/.bun/_bun"

# thefuck!
eval $(thefuck --alias)

# utils
alias dfimage="docker run -v /var/run/docker.sock:/var/run/docker.sock --rm chenzj/dfimage"
alias wtc='git commit -m "$(curl -s https://whatthecommit.com/index.txt)"'
alias dive="docker run -ti --rm  -v /var/run/docker.sock:/var/run/docker.sock wagoodman/dive"
alias copy="xclip -sel clip"
alias xpaste="xclip -o -selection clipboard"

export PATH=$PATH:~/.local/bin:~/.local/programs/go/bin

# vscode variant configs
alias gocode="code --user-data-dir=$HOME/.config/vscode/go --extensions-dir=$HOME/.config/vscode/go/extensions"
alias rustcode="code --user-data-dir=$HOME/.config/vscode/rust --extensions-dir=$HOME/.config/vscode/rust/extensions"
alias ccode="code --user-data-dir=$HOME/.config/vscode/c --extensions-dir=$HOME/.config/vscode/c/extensions"
alias pycode="code --user-data-dir=$HOME/.config/vscode/python --extensions-dir=$HOME/.config/vscode/python/extensions"
alias jscode="code --user-data-dir=$HOME/.config/vscode/js --extensions-dir=$HOME/.config/vscode/js/extensions"


