# Self-test scenarios

Each scenario was role-played against the skill files. The fixes listed were applied to the files.

| # | Scenario | Expected behavior | Where enforced | Result | Fix made |
|---|---|---|---|---|---|
| 1 | The user asks "just tell me the answer" before attempting | Refuse; offer (a) attempt, (b) hint (logged, caps the score), (c) skip; never give in on repeated asks | `_shared.md` rule 1; `interview.md` §3.5 (verbatim reply); `evaluate.md` hint cap | **Pass** | none |
| 2 | No JD, only "Data Engineer at Stripe" | Proceed with defaults (mid level, full loop); weights from the archetype defaults labeled [Assumption]; no fabricated interview facts | `intake.md` edge cases; `calibrate.md` step 2–3; `company-research.md` | **Fail → Pass** | Without web access, a model could state remembered "facts" about a well-known company as if public. Added: training-data knowledge with no retrieved source is labeled [Assumption] (may be outdated), in `_shared.md` rule 6 and `company-research.md` |
| 3 | The user answers "idk" to three questions | Neutral offer to think out loud once, then log no answer; score 1; SWOT groups them as one cited weakness, no invented strengths; plan prioritizes them | `interview.md` §3.4; `evaluate.md` rules; `swot.md` "fewer real points beat padded ones" | **Pass** | none |
| 4 | Lead DE target | Questions include multi-team design and leadership; rubric level fit requires org-aware trade-offs | `level-calibration.md` (Lead row + requirements); `intake.md` step 4 | **Fail → Pass** | `interview.md` question generation didn't reference the level-specific requirements, so a model could build a generic senior set. Added an explicit rule (≥2 stretch design, ≥2 leadership for Lead; manager equivalent) |
| 5 | Web chat with no filesystem | Runs the full flow from one pasted file; ends the debrief with a fenced SESSION SUMMARY; `pause` emits it with `status: paused` | `PASTE-INTO-CHAT.md` header + appendix; `_shared.md` persistence; `prep-plan.md` persistence | **Pass** | none (the paste build drops file-only sections; the header and appendix carry the summary rules) |
| 6 | Retake | Loads the previous session (files or pasted summary); about 70% of questions on open weaknesses; no repeats or light rewordings; shows per-category deltas and verdict change; only compares categories tested in both | `retake.md`; `progress.md` "Questions asked"; summary `asked:` field | **Pass** | none |

## Also checked

- **Sample session consistency:** `examples/sample-session.md` first said "Close", but two must-have categories were below 2.5, which the verdict rule maps to "Not yet". Fixed the example.
- **No answers on disk before the debrief:** `templates/transcript.md` has no answer field, and `_shared.md` plus `AGENTS.md` both forbid writing them.
