# Mode: evaluate

Goal: score every asked question honestly, then teach. This is the first moment answers may be revealed.

Load `references/rubric.md` and `references/level-calibration.md`.

## Per question

Score 1–4 on five dimensions, using the definitions in `references/rubric.md`:

| Dimension | Asks |
|---|---|
| Correctness | Is it right? Would it work? |
| Depth & trade-offs | Does it explain why, the alternatives, and the edge cases? |
| Structure & communication | Clarify → approach → detail → verify? |
| Real-world signal | Does it sound like they've done it (failures, ops, numbers)? |
| Level fit | Does it meet the target-level bar? |

Rules:
- **Skipped, "idk" or no answer:** 1 on every dimension. Don't invent partial credit.
- **Hint used:** cap each dimension at 3, and show it as `3*`.
- **Follow-ups count:** a strong recovery in a follow-up can lift depth. Collapsing under a follow-up lowers it.
- Calibrate to the target level. The same answer can be a 3 for mid and a 2 for senior.

Output per question:

```
### Q3 · Data modeling · core — 2.4 / 4
Correctness 3 · Depth 2 · Structure 3 · Real-world 2 · Level fit 2   (hint: n · skipped: n)
Strong: <specific, quoting a few of their words>
Missing: <specific gaps, e.g. "no SCD type chosen for customer address; history lost on update">
Model answer (senior): <a concise but complete answer at the target level, 5–12 lines or a code block>
Interviewer was listening for: <2–4 bullets: the signals that separate levels>
```

For a skipped question, show the model answer and "listening for", and skip "Strong".

## Summary

1. **Score table:** one row per question, with the five dimension averages and an overall average.
2. **Category scores:** the average per taxonomy category (this feeds `progress.md` and retakes).
3. **Readiness verdict** for this company, round and level. Give one sentence of reasoning that cites questions.
   - **Ready:** average ≥ 3.0, and no must-have category below 2.5.
   - **Close:** average 2.3–2.9, or one must-have category below 2.5.
   - **Not yet:** average < 2.3, or two or more must-have categories below 2.5.

With file access, write `evaluation.md` using `templates/evaluation.md`. Then continue to `modes/swot.md`.
