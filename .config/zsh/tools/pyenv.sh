# pyenv
if [[ -d $HOME:/.pyenv ]] then
  export PATH=$PATH:/home/ainyava/.pyenv/bin
  eval "$(pyenv init -)"
  eval "$(pyenv virtualenv-init -)"
fi
