#!/usr/bin/env bash
#
# Install the spec-driven development kit into ~/.claude so its /spec:* commands,
# the spec-researcher agent, and the templates are available in every project.
#
# Idempotent: re-running updates the symlinks. Editing files in this repo updates
# the installed commands instantly (they're symlinks back here).
#
set -euo pipefail

KIT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
CLAUDE_DIR="${CLAUDE_CONFIG_DIR:-$HOME/.claude}"

CMD_LINK="$CLAUDE_DIR/commands/spec"
TPL_LINK="$CLAUDE_DIR/spec-templates"
AGENT_LINK="$CLAUDE_DIR/agents/spec-researcher.md"

link() {
  local target="$1" linkname="$2"
  mkdir -p "$(dirname "$linkname")"
  if [ -L "$linkname" ] || [ -e "$linkname" ]; then
    rm -rf "$linkname"
  fi
  ln -s "$target" "$linkname"
  echo "  linked $linkname -> $target"
}

echo "Installing spec-driven kit from: $KIT_DIR"
echo "Into Claude config dir:          $CLAUDE_DIR"
echo

link "$KIT_DIR/commands/spec"            "$CMD_LINK"
link "$KIT_DIR/templates"                "$TPL_LINK"
link "$KIT_DIR/agents/spec-researcher.md" "$AGENT_LINK"

echo
echo "Done. Available commands: /spec:init /spec:specify /spec:clarify /spec:plan"
echo "      /spec:tasks /spec:implement /spec:verify /spec:analyze /spec:adopt"
echo
echo "Next: cd into a project and run  /spec:init   (or  /spec:adopt  for existing code)."
