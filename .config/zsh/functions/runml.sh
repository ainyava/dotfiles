runml() {
  local tmpfile=$(mktemp /tmp/runml_XXXXXX.sh)
  local desc="${1:-}"
  local histdir="$HOME/.runml_history"
  mkdir -p "$histdir"

  # seed with shebang + optional description comment
  {
    echo "#!/usr/bin/env bash"
    echo "set -euo pipefail"
    [[ -n "$desc" ]] && echo "# $desc"
    echo ""
  } > "$tmpfile"

  ${EDITOR:-nvim} "$tmpfile"

  if [[ ! -s "$tmpfile" ]]; then
    echo "runml: empty file, aborting." >&2
    rm -f "$tmpfile"
    return 1
  fi

  # save to history with timestamp
  local ts=$(date +%Y%m%d_%H%M%S)
  cp "$tmpfile" "$histdir/${ts}.sh"

  echo "--- running ---"
  bash "$tmpfile"
  local exit_code=$?
  rm -f "$tmpfile"
  return $exit_code
}
