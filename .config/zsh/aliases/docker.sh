
alias dfimage="docker run -v /var/run/docker.sock:/var/run/docker.sock --rm chenzj/dfimage"
alias wtc='git commit -m "$(curl -s https://whatthecommit.com/index.txt)"'
alias dive="docker run -ti --rm  -v /var/run/docker.sock:/var/run/docker.sock wagoodman/dive"
alias copy="xclip -sel clip"
alias xpaste="xclip -o -selection clipboard"

# psql
psql-docker() {
    docker run --rm -it -v "$(pwd)":/host --network=host postgres "$@"
}

