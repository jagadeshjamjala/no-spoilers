---
description: Set up a no-spoilers mock interview here (intake + research), then run it in your web interview room
argument-hint: [company and role, e.g. "Stripe senior data engineer"]
allowed-tools: Read, Write, Bash(open:*), Bash(pbcopy:*), mcp__claude-artifacts__guide, mcp__claude-artifacts__publish_files, mcp__claude-artifacts__declare_capabilities, mcp__claude-artifacts__get_artifact, mcp__claude-artifacts__db_write
---

Use the no-spoilers skill: read `.agents/skills/no-spoilers/SKILL.md` and `modes/_shared.md`, then run **only** stage 1 (`modes/intake.md`) and stage 2 (`modes/calibrate.md`) here, including web research. Known so far: $ARGUMENTS

The interview itself runs in the user's web interview room. Its `slug` and `url` are in `.no-spoilers-room.json` in the repo root. If that file is missing, first follow `.claude/commands/setup.md` to create the room, then continue.

After the user confirms the setup and you've shown the calibration summary, do **not** ask any interview questions here. Hand off instead:

1. Save `setup.md` under `sessions/` as usual.
2. Call `mcp__claude-artifacts__db_write` with the room's slug and one op: `set` at path `handoff/h<unix-ms>`, data `{ "title": "<Company> · <Role>", "created": <unix-ms>, "setup": "<the full setup.md, then the JD text and the user's background verbatim if given>" }`. The setup carries context only: no questions, no answers, no rubric notes.
3. Run `open "<url>"`.
4. Tell the user in two lines: click **Start <title> interview** on the page (reload it if it was already open); follow-ups, hints, the debrief and downloads all happen there.

If the db_write fails, pipe "Start the interview with this setup (intake and calibration are done):" plus the same setup text into `pbcopy`, open the page, and tell the user plainly: click **New interview**, paste with ⌘V/Ctrl+V (don't type the company name, or the page starts its own setup without your research), then Send. Mention that restarting Claude Code usually brings the direct handoff back.
