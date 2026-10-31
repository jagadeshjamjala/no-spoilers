# no-spoilers

**A mock-interview coach for data roles that won't tell you the answer until you've tried.**

You tell it the company, the role, and (optionally) the JD and your resume. It runs a realistic mock interview, holding back answers and hints until you've attempted each question, then scores you honestly, gives you an evidence-based SWOT, and builds a prep plan to work through before a targeted retake.

It's built for data engineers first, and also analytics engineers, data analysts, platform/ML data engineers, and Lead DE / DE manager candidates. It's markdown only, with no code to run, and works in Claude Code, Codex, Gemini CLI, Cursor, Copilot, OpenCode, Claude.ai, ChatGPT and Gemini.

## 30-second demo

```
you>  /mock Ledgerly senior data engineer — JD in examples/sample-jd-fintech-senior-de.md, interview in 5 days
coach> Ledgerly · Senior Data Engineer · full loop · 12 questions, one at a time. Level: senior ("5+ years…" [JD]). Good to go?
you>  go
coach> Q2 of 12 · SQL · core — `payment_attempts(...)`: retries share a payment_intent_id. Finance says the success rate is inflated…
you>  just tell me the answer
coach> I'll hold the answer for the debrief. You can (a) attempt it, (b) take a `hint` (lowers the max score), or (c) `skip`.
…
coach> Verdict: Not yet. Modeling 1.6 (Q3, Q5) and streaming 2.0 (Q4) are must-haves below the senior bar. Top 3 fixes: …
```

See the full worked run in [`examples/sample-session.md`](examples/sample-session.md).

## How it works

1. **Intake:** the company, role, level (inferred if not given), round type, number of questions, and days until the interview.
2. **Calibrate:** it weights topics by the JD, researches the company (cited, or labeled as an assumption), and finds resume claims to probe.
3. **Interview:** realistic scenario questions, one at a time. It asks neutral follow-ups like a real interviewer, with no hints or praise.
4. **Debrief:** each answer gets a 1–4 score on correctness, depth, communication, real-world signal and level fit, plus a model answer, what the interviewer was listening for, and a readiness verdict.
5. **SWOT + prep plan, then `retake`:** cited strengths and weaknesses, the top 3 fixes with timed drills, and scripts for honestly answering about experience gaps. A retake uses new questions on your weak spots and shows score deltas.

## Install

**Claude Code**
```sh
git clone <this-repo> no-spoilers && cd no-spoilers && claude
```
Then type `/mock <company> <role>`, or just say "mock interview for …". The skill lives at `.claude/skills/no-spoilers/SKILL.md`, which is a symlink to `.agents/skills/no-spoilers/SKILL.md`. Run Claude Code from the repo root, because the skill loads `modes/` and `references/` from there.

**Codex CLI / OpenCode:** clone the repo and run the tool in the repo root. Both read `AGENTS.md` natively.

**Gemini CLI:** clone the repo and run `gemini` in the repo root. `GEMINI.md` imports `AGENTS.md`.

**Cursor:** open the folder. The rule `.cursor/rules/no-spoilers.mdc` triggers on interview-prep requests.

**GitHub Copilot (chat/agent):** open the folder. `.github/copilot-instructions.md` points it at `AGENTS.md`.

**Web chats:** use [`PASTE-INTO-CHAT.md`](PASTE-INTO-CHAT.md), one self-contained file (~27k characters).
- **Claude.ai:** create a Project and paste the file into its instructions, or just paste it as your first message.
- **ChatGPT:** for a one-off, paste it as your first message. For a custom GPT, upload it as a Knowledge file, because GPT instructions are capped at 8,000 characters. Then set the instructions to: "Follow PASTE-INTO-CHAT.md exactly. Never reveal answers before the user attempts a question."
- **Gemini:** create a Gem and paste the file into its instructions, or paste it as your first message.

Chats can't save files, so at the end you get a `SESSION SUMMARY` block. Save it, and paste it back with `retake` next time.

## Commands

| Command | What it does |
|---|---|
| `/mock [company role]` | Start a new mock interview (Claude Code). Elsewhere, say "mock interview for …". |
| `hint` | One nudge for the current question. It's logged, and the max score drops to 3. |
| `skip` | Record no answer. The answer is revealed in the debrief. |
| `repeat` | Restate the current question. |
| `pause` | Save your progress and stop. |
| `end` | Go straight to the debrief. |
| `retake` / `/retake` | New questions on your open weaknesses, plus progress deltas. |

## Your profile (optional)

Copy `profile/me.example.md` to `profile/me.md` and fill it in, so you don't have to paste your resume each time.

## Privacy

Sessions are saved locally under `sessions/<company>-<role>/<date>/`. Both `sessions/` and `profile/me.md` are **gitignored**, so your answers, resume and scores aren't committed. In web chats, what you paste goes to that chat provider under their terms.

## Repo layout

| Path | What's in it |
|---|---|
| `AGENTS.md` | Canonical agent instructions. `CLAUDE.md`, `GEMINI.md`, and the Cursor/Copilot files are thin wrappers. |
| `.agents/skills/no-spoilers/SKILL.md` | The skill entrypoint: rules and the stage sequence. |
| `modes/` | One file per stage. `_shared.md` holds the non-negotiable rules. |
| `references/` | Topic taxonomy, level calibration, question design, rubric, company research. |
| `templates/` | Session file skeletons, and the parts used to build `PASTE-INTO-CHAT.md`. |
| `examples/` | A sample fintech JD and a full worked session. |
| `tests/scenarios.md` | Role-play self-tests of the rules. |

## Contributing

- **Add question patterns:** add a row to the template table, or a rung to the follow-up ladder, in `references/question-design.md`. Questions must be scenario-based (symptom + tables + scale), never trivia, and must not name the technique in the question.
- **Add a role or taxonomy area:** add a category row (ID, subtopics, strong-answer signals) and an archetype weight row in `references/de-topic-taxonomy.md`, and, if the level bar differs, a note in `references/level-calibration.md`.
- **Change a mode:** keep `modes/` as plain, tool-agnostic markdown, and put tool-specific syntax only in the wrapper files. Then run `./scripts/build-paste.sh` to regenerate `PASTE-INTO-CHAT.md`, and re-run the scenarios in `tests/scenarios.md` by role-play.
- Don't relax the no-spoilers rules in `modes/_shared.md`. They're the point.

## License

MIT
