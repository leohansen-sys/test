#!/bin/bash
set -euo pipefail

# Install REA (Reverse Engineer Anything) for Claude Code cloud sessions.
# Only runs in remote (cloud) environments; local sessions are untouched.
if [ "${CLAUDE_CODE_REMOTE:-}" != "true" ]; then
  exit 0
fi

# Idempotent: skip if the CLI is already available (container state is cached).
if ! command -v rea >/dev/null 2>&1; then
  npm install --global rea-agents --ignore-scripts >/dev/null 2>&1
fi

echo "REA (Reverse Engineer Anything) available: $(rea --version)"
