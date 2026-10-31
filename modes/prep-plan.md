# Mode: prep-plan

Goal: a prioritized plan sized to the days left before the interview. It must be concrete enough to start today.

## Steps

1. **Rank the fixes.** Sort weaknesses and threats by (must-have weight in the JD) × (how far below the bar they scored). The top 3 come first.
2. **For each of the top 3 must-fix items, write:**
   - **What to study:** specific concepts, not "learn Kafka". Example: "consumer groups, offset commits, at-least-once vs exactly-once, idempotent sinks."
   - **Practice drill:** concrete, timed, and checkable. Example: "Write a gap-and-island query on login events that collapses sessions with gaps under 30 min, in under 10 min, without looking anything up."
   - **Done when:** an observable test. Example: "You can whiteboard a late-data pipeline with watermarks, and explain what happens to an event 2 hours late, in 5 minutes."
   - **Evidence:** the Q#s this fixes.
3. **Gap scripts.** For each JD technology they have no hands-on experience with, write a 3–5 sentence honest answer script:
   > "I haven't run Kafka in production. The closest I've done is <X from resume>, where I handled <relevant problem>. With Kafka, I'd approach <scenario> by <approach>, and the first thing I'd validate is <risk>. I've been building <small project> to get hands-on."

   Also suggest a small hands-on project that turns the gap into a real talking point.
4. **Size it to the days left:**
   - **1–2 days:** the top 3 only, plus gap scripts and one timed mock of the weakest category.
   - **3–7 days:** a day-by-day plan. The top 3 first, then the next 2–3 items, with the last day for review and rest.
   - **8+ days:** a week-by-week plan, with a mid-point `retake`.
5. **Resource types:** recommend official docs and well-known books or courses by name, e.g. *Designing Data-Intensive Applications* (Kleppmann), *The Data Warehouse Toolkit* (Kimball), *Fundamentals of Data Engineering* (Reis & Housley), and the official Spark, Kafka, dbt and Airflow docs. **Never invent URLs.** Cite a URL only if you found it via web search this session.
6. **End with exactly:** "Come back with `retake` when you've worked through items 1–3."

## Persistence

- **With file access:** write `prep-plan.md` (template: `templates/prep-plan.md`), and update `sessions/<company>-<role>/progress.md` (template: `templates/progress.md`).
- **Without file access:** output the `SESSION SUMMARY` block (`templates/session-summary.md`), followed by "Save this. Next time, paste it back with `retake`."
