# kubectl
export KUBE_EDITOR=nvim
source <(kubectl completion zsh)
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"
