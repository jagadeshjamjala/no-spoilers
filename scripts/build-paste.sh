#!/bin/sh
# Rebuilds PASTE-INTO-CHAT.md from modes/ (maintainers only; using the skill needs no code).
# File-persistence sections are dropped: web chats can't write files, and the header/appendix cover SESSION SUMMARY.
set -e
cd "$(dirname "$0")/.."
{
  cat templates/paste-header.md
  for f in _shared intake calibrate interview evaluate swot prep-plan retake; do
    awk '/^## Persistence/{s=1;next} /^#{1,2} /{s=0} !s' "modes/$f.md"; echo
  done
  cat templates/paste-appendix.md
} > PASTE-INTO-CHAT.md
wc -c PASTE-INTO-CHAT.md
