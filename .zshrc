export ZSH="$HOME/.oh-my-zsh"


# zsh
ZSH_THEME="bira"
plugins=(git zsh-autosuggestions golang argocd kubectl kube-ps1 ansible helm nmap rust fzf-zsh-plugin)

source $ZSH/oh-my-zsh.sh

export TERM=xterm-256color
export PATH=$PATH:~/.local/bin:~/.local/programs/go/bin

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

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

function openlvim() {
    alacritty --class Lvim -e lvim "$1"
}
function uvvenv() {
  uv virtualenv ~/.uv/$1;
}
function uvactivate() {
  source ~/.uv/$1/bin/activate;
}

# ripgrep->fzf->vim [QUERY]
rfv() (
  RELOAD='reload:rg --column --color=always --smart-case {q} || :'
  OPENER='if [[ $FZF_SELECT_COUNT -eq 0 ]]; then
            nvim {1} +{2}     # No selection. Open the current line in Vim.
          else
            nvim +cw -q {+f}  # Build quickfix list for the selected items.
          fi'
  fzf --disabled --ansi --multi \
      --bind "start:$RELOAD" --bind "change:$RELOAD" \
      --bind "enter:become:$OPENER" \
      --bind "ctrl-o:execute:$OPENER" \
      --bind 'alt-a:select-all,alt-d:deselect-all,ctrl-/:toggle-preview' \
      --delimiter : \
      --preview 'bat --style=full --color=always --highlight-line {2} {1}' \
      --preview-window '~4,+{2}+4/3,<80(up)' \
      --query "$*"
)

# welcome
fortune | cowsay -f /usr/share/cowsay/cows/eyes.cow | centerize | lolcat 
