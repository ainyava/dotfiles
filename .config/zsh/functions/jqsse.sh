jqsse() {
    local jq_query="."
    local jq_flag="-r"
    local slurp=false

    while [[ $# -gt 0 ]]; do
        case "$1" in
            -q|--query)   jq_query="$2"; shift 2 ;;
            --no-raw)     jq_flag="";    shift   ;;
            -s|--slurp)   slurp=true;    shift   ;;
            *)            jq_query="$1"; shift   ;;
        esac
    done

    if $slurp; then
        awk '/^data: / { line=substr($0,7); if (line!="[DONE]") print line }' \
            | jq -s $jq_flag "[.[] | $jq_query][]"
    else
        while IFS= read -r line; do
            [[ "$line" == data:* ]] || continue
            local data="${line#data: }"
            [[ "$data" == "[DONE]" ]] && break
            echo "$data" | jq -e $jq_flag "($jq_query) // empty" 2>/dev/null && true
        done
    fi
}
