source_dir() {
  local dir_path="$HOME/.config/zsh/$1"

  if [[ -d "$dir_path" ]]; then
    local files=($dir_path/*.sh)
    for i in $files; do
      source "$i"
    done
  fi
}

source_dir "shell"
source_dir "tools"
source_dir "functions"
source_dir "aliases"
source_dir "envs"

# private
[ -s ~/.config/private_zshrc.sh ] && source ~/.config/private_zshrc.sh
