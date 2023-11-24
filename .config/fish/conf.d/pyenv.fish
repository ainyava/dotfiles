set -Ux PYENV_ROOT $HOME/.pyenv
fish_add_path $PYENV_ROOT/bin
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

