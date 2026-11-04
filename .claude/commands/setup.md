---
description: One-time setup — publish your own private no-spoilers interview room on claude.ai
allowed-tools: Read, Write, Bash(open:*), mcp__claude-artifacts__guide, mcp__claude-artifacts__publish_files, mcp__claude-artifacts__declare_capabilities, mcp__claude-artifacts__get_artifact
---

Set up (or update) this user's web interview room. Do it without asking questions.

1. If `.no-spoilers-room.json` exists in the repo root, read its `slug`, call `get_artifact` for the live version, and republish `web/no-spoilers.html` as `index.html` with `publish_files` (slug + base_version). If that artifact is gone or not theirs, continue as if the file did not exist.
2. Otherwise publish `web/no-spoilers.html` as `index.html` with `publish_files`, title "No-Spoilers Interview Room", icon "chat". The new artifact is private to the user.
3. Call `declare_capabilities` on it with exactly `{"sample": {}, "db": {}, "user": {}, "downloads": true}` and the version from the publish result.
4. Write `.no-spoilers-room.json` (gitignored) as `{"slug": "<slug>", "url": "<url>"}`.
5. Run `open "<url>"` and tell the user in two lines: the room is ready (give the url), and they can now run `/mock <company> <role>`.

If the claude-artifacts tools aren't available, say so in one line and tell them they can still interview in the terminal by saying "mock interview for <company> <role>".
