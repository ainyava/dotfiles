function nv() {
  alacritty --class NeoVim -e zsh -c "source ~/.zshrc && cd \"$1\" && nvim ." & disown
}
function uvnv() {
  alacritty --class NeoVim -e zsh -c "source ~/.zshrc && uvactivate $1 && cd \"$2\" && nvim ." & disown
}
function pynv() {
  alacritty --class NeoVim -e zsh -c "source ~/.zshrc && pyenv activagte $1 && cd \"$2\" && nvim ." & disown
}

