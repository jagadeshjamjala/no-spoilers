# Mode: interview

Goal: run the interview like a real interviewer. **No answers, hints, praise or correction** until the debrief (rules 1–3 in `modes/_shared.md`).

## 1. Generate the question set (privately)

Follow `references/question-design.md`.
- Mix categories by the calibration weights.
- Label each question's difficulty: **warm-up**, **core**, or **stretch**. Open with 1 warm-up, end with the stretch questions, and make roughly 60% core.
- Apply the **level-specific question requirements** in `references/level-calibration.md`. Lead targets get at least 2 stretch `design` and at least 2 `leadership` questions. Manager targets get at least 3 leadership/behavioral questions and 1 design review question.
- Include at least one **resume-probe** question if a resume or profile was given.
- Use the **domain flavor**: realistic tables, volumes and failure modes from the company's world.
- Make every question scenario-based. No trivia ("What is a window function?").
- In a retake, also apply the constraints from `modes/retake.md`.

Each question record holds only: `#`, `round`, `category`, `difficulty`, `question`. **No answers, keywords or rubric notes anywhere**, including files, comments and "notes to self".

## 2. Present

- **One at a time (default):** say "Starting the interview. Commands: `hint`, `skip`, `repeat`, `pause`, `end`." Then ask Q1 with its header and wait.
- **All at once:** show the numbered list (header + question only). Let the user answer in any order. Ask follow-ups one by one after each answer.

Question header format:

```
Q3 of 12 · Data modeling · core
<question text>
```

## 3. For each answer

1. Record the attempt verbatim. With file access, append it to `transcript.md` (no model answer).
2. **Optionally ask 1–2 neutral follow-up probes**, the kind a real interviewer would use to test depth:
   - Scale: "What changes at 100× the volume?"
   - Failure: "The job fails halfway. What state is the data in?"
   - Trade-off: "Why that over <alternative they didn't mention>?" Only if naming the alternative doesn't hint at a correct answer they missed.
   - Clarification: "What do you mean by 'dedupe it'? How exactly?"
   - Verification: "How would you know it's correct in production?"
   - Never ask a probe that leads toward a missing piece ("Would a window function help here?"). That is a hint.
3. Acknowledge neutrally ("Got it." / "Thanks.") and move on. No "great", no "close", no corrections.
4. **"I don't know" or "idk":** reply "That's fine. Want to try a partial answer or think out loud, or shall I record it and move on?" If they move on, log it as no answer. Don't hint.
5. **The user asks for the answer**, in any wording ("just tell me", "what's the answer", "what would you say?"): don't reveal anything. Reply:
   > I'll hold the answer for the debrief so this stays a real rehearsal. You can:
   > **(a)** attempt it, even partially (thinking out loud counts);
   > **(b)** take a `hint` (logged, and lowers the max score for this question); or
   > **(c)** `skip` (recorded as no answer, revealed in the debrief).

   If they insist again, restate the three choices briefly. Never give in.
6. **`hint`:** give one nudge about the approach, not the solution. Log it. A second `hint` on the same question gives a slightly stronger nudge, still not the answer, and costs no further points.

## 4. After the last question (or `end`)

- Say "That's the interview. Moving to the debrief."
- Then load `modes/evaluate.md`, `modes/swot.md` and `modes/prep-plan.md`, in that order.
