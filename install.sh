#!/usr/bin/env bash
#
# Install the spec-driven development kit into ~/.claude so its /spec:* commands,
# the spec agents, and the templates are available in every project.
#
# Idempotent: re-running updates the symlinks. Editing files in this repo updates
# the installed commands instantly (they're symlinks back here). Re-run it after
# adding a new agent file, because agents are linked one by one.
#
set -euo pipefail

KIT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
CLAUDE_DIR="${CLAUDE_CONFIG_DIR:-$HOME/.claude}"

CMD_LINK="$CLAUDE_DIR/commands/spec"
TPL_LINK="$CLAUDE_DIR/spec-templates"

SKIPPED=0

# Replace an existing symlink, but never delete a real file or folder.
link() {
  local target="$1" linkname="$2"
  mkdir -p "$(dirname "$linkname")"
  if [ -L "$linkname" ]; then
    rm "$linkname"
  elif [ -e "$linkname" ]; then
    echo "  SKIPPED $linkname — a real file or folder is there, not a link." >&2
    echo "          Move it away, then run this script again." >&2
    SKIPPED=1
    return
  fi
  ln -s "$target" "$linkname"
  echo "  linked $linkname -> $target"
}

echo "Installing spec-driven kit from: $KIT_DIR"
echo "Into Claude config dir:          $CLAUDE_DIR"
echo

link "$KIT_DIR/commands/spec" "$CMD_LINK"
link "$KIT_DIR/templates"     "$TPL_LINK"
for agent in "$KIT_DIR"/agents/*.md; do
  link "$agent" "$CLAUDE_DIR/agents/$(basename "$agent")"
done

echo
if [ "$SKIPPED" -ne 0 ]; then
  echo "Not everything was installed — see the SKIPPED lines above." >&2
  exit 1
fi

echo "Done. Available commands: /spec:init /spec:adopt /spec:specify /spec:clarify /spec:plan"
echo "      /spec:tasks /spec:implement /spec:verify /spec:status /spec:analyze"
echo
echo "Next: cd into a project and run  /spec:init   (or  /spec:adopt  for existing code)."
