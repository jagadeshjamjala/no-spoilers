#!/bin/sh
# Builds dist/no-spoilers.zip: a self-contained skill folder for marketplaces (e.g. Agensi) that install one SKILL.md folder.
# Paths become relative to the skill folder; sessions/ and profile/ live in the user's working directory.
set -e
cd "$(dirname "$0")/.."
out=dist/no-spoilers
rm -rf dist && mkdir -p "$out/templates"
sed 's|^All paths below are relative to the repo root (the folder that contains `AGENTS.md`).|Paths to `modes/`, `references/` and `templates/` are relative to this skill'"'"'s folder. `sessions/` and `profile/me.md` are in the user'"'"'s current working directory, never inside the skill folder.|' \
  .agents/skills/no-spoilers/SKILL.md > "$out/SKILL.md"
grep -q "relative to this skill's folder" "$out/SKILL.md" || { echo "SKILL.md path line not rewritten" >&2; exit 1; }
cp -R modes references examples "$out/"
for f in templates/*.md; do case "$f" in templates/paste-*) ;; *) cp "$f" "$out/templates/" ;; esac; done
cp profile/me.example.md "$out/templates/profile-me.example.md"
cp LICENSE "$out/"
(cd dist && zip -qr no-spoilers.zip no-spoilers -x '*.DS_Store')
unzip -l dist/no-spoilers.zip | tail -1
