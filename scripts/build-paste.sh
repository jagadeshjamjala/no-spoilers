#!/bin/sh
# Rebuilds PASTE-INTO-CHAT.md (and the web page copy) from modes/ (maintainers only; using the skill needs no code).
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

# Inline the same file into the web interview room (between its @@SKILL markers).
if grep -qi '</script' PASTE-INTO-CHAT.md; then echo "PASTE-INTO-CHAT.md contains </script; can't inline" >&2; exit 1; fi
awk 'FNR==NR{p=p $0 "\n"; next} /@@SKILL-END@@/{printf "%s", p; s=0} !s{print} /@@SKILL-START@@/{s=1}' PASTE-INTO-CHAT.md web/no-spoilers.html > web/.tmp.html
mv web/.tmp.html web/no-spoilers.html
