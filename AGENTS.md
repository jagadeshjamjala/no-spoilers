# AGENTS.md — no-spoilers

This repo is a markdown-only skill: a mock-interview coach for data roles.

When the user asks for a mock interview, interview prep, "prepare me for <company>", or says `retake`:

1. Read `.agents/skills/no-spoilers/SKILL.md` and follow it.
2. Always load `modes/_shared.md` first; its rules are non-negotiable (no spoilers, no answers in the question set, interviewer behavior, evidence-based and honest scoring, no invented company facts, coachable gaps).
3. Load each `modes/*.md` and `references/*.md` file only when its stage starts.
4. Save sessions under `sessions/` (gitignored). Never write model answers to disk before the debrief.

When editing the repo itself (not running an interview): keep `modes/` tool-agnostic plain markdown; tool-specific syntax belongs only in wrapper files. Regenerate `PASTE-INTO-CHAT.md` after changing modes (see README → Contributing).
