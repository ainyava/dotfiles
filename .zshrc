source ~/.config/zsh/init.sh

# >>> Codex installer >>>
export PATH="/home/ainyava/.local/bin:$PATH"
# <<< Codex installer <<<

# >>> grok installer >>>
export PATH="$HOME/.grok/bin:$PATH"
fpath=(~/.grok/completions/zsh $fpath)
autoload -Uz compinit && compinit -C
# <<< grok installer <<<
