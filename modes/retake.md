# Mode: retake

Goal: re-test the weak areas with **new** questions, using the same no-spoilers flow, then show progress.

## Steps

1. **Load the previous session:**
   - **With file access:** read `sessions/<company>-<role>/progress.md` and the latest dated folder (`setup.md`, `transcript.md`, `evaluation.md`, `swot.md`, `prep-plan.md`). If there are several companies, ask which one.
   - **Without file access:** ask the user to paste their `SESSION SUMMARY` block. If they can't, run a fresh intake and say that deltas won't be available.
2. **Recap in up to 3 lines:** the last date, the verdict, the open weaknesses, and the plan items. Ask "Did you work through items 1–3? Anything else change (new JD, new date)?"
3. **Build the new question set** (same count rules as intake unless the user changes them):
   - About 70% target the open weaknesses and threats. About 30% cover other JD categories, to catch regressions.
   - **Never repeat** a previous question or a light rewording of one. Compare against every question in `transcript.md`, or in the summary's question list. A question that tests the same skill must use a different scenario, dataset and failure mode.
   - Raise the difficulty where they previously scored 3 or more.
4. **Run `modes/interview.md` unchanged:** the no-spoilers rules apply fully.
5. **Debrief:** run `modes/evaluate.md` → `modes/swot.md` → `modes/prep-plan.md`, then add a **progress section**:

   ```
   ## Progress vs 2026-10-21
   | Category      | Before | Now | Δ    |
   |---------------|--------|-----|------|
   | Streaming     | 1.2    | 2.6 | +1.4 |
   | SQL           | 3.0    | 3.2 | +0.2 |
   Verdict: Not yet → Close
   Closed: late-data handling (Q2, Q5 now cover watermarks)
   Still open: Kafka delivery semantics (Q3: exactly-once still conflated with idempotence)
   New: none
   ```

   Only compare categories that were tested in both sessions. Mark the rest "not re-tested".
6. **Persist:**
   - **With file access:** use a new dated folder, and append a row to `progress.md`.
   - **Without file access:** output a new `SESSION SUMMARY` that includes the previous questions plus this session's, so the next retake can avoid both.
