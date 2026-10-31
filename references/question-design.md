# Question design

## Principles

1. **Scenario, not trivia.** Put the concept inside a realistic problem with tables, volumes and a symptom.
   - Bad: "What is a window function?"
   - Good: "Our daily active users table double-counts users who log in across midnight UTC. How would you find and fix it in SQL?"
2. **Domain-flavored.** Use the company's world (see the domain flavors in `de-topic-taxonomy.md`). A fintech gets ledgers and disputes, not generic "orders".
3. **Concrete enough to answer, open enough to show depth.** Give the shape of the tables, the scale and the symptom. Leave the approach open.
4. **Underspecified on purpose, sometimes.** Leave 1–2 requirements unstated in design questions. Asking about them is part of what's scored (structure).
5. **One question tests one main skill.** It can touch others, but the score should map to one category.
6. **No answer in the question.** Don't name the technique ("Using LAG, find…") unless the round explicitly tests that syntax.
7. **Never repeat across sessions.** Retakes use new scenarios.

## Difficulty

- **Warm-up:** one concept, a familiar setting. It gets them talking. Example: "Walk me through a pipeline you own today: sources, schedule, and how you'd know it broke."
- **Core:** a realistic problem at the target level, with 2–3 trade-offs to discuss.
- **Stretch:** scale, ambiguity or organizational constraints beyond the target level. It should be possible to do well on it.

## Templates by category

| Category | Template | Example (fintech flavor) |
|---|---|---|
| sql | Symptom in a metric → find and fix it | "`payments` has one row per attempt; retries share a `payment_intent_id`. Finance says the success rate is inflated. Write a query for the true daily success rate per merchant." |
| modeling | Business process + change over time → design the model | "Merchants change their pricing plan mid-month, and finance needs historically accurate fee reports. Design the tables." |
| batch | Incremental load + failure → make it safe | "A nightly job loads settlement files from a bank SFTP. Sometimes a file arrives twice, or a day late. Design the load." |
| spark | Slow or failing job + symptoms → diagnose | "A join between 2B transactions and 50M merchants takes 3 hours, and one task runs 40 minutes while the others take 30 seconds. What's happening, and what would you try?" |
| streaming | Event stream + disorder or duplicates → design for correctness | "Card authorization events go to Kafka. Downstream fraud features need per-card 5-minute counts. Some events arrive 10 minutes late, and some twice. Design it." |
| warehouse | Cost or latency complaint → fix it | "BigQuery costs tripled after analysts started querying the events table directly. What do you look at, and what do you change?" |
| orchestration | Dependency, backfill or rerun scenario | "You need to backfill 2 years of a dbt incremental model after a logic fix, without breaking the daily run. How?" |
| quality | Silent data failure → detect and prevent | "A partner silently started sending amounts in cents instead of dollars. Revenue jumped 100× for two days before anyone noticed. What would have caught it?" |
| design | Product need + scale numbers → end-to-end design | "Design the pipeline that powers merchants' real-time balance view: 20k events/sec at peak, with a correct balance within 5 seconds." |
| governance | Compliance request against an immutable data lake | "A customer requests deletion under GDPR. Their data is in raw Parquet in S3, in Iceberg tables, and in last year's backups. What do you do?" |
| migration | Legacy system + risk → plan | "Move 400 Teradata BTEQ jobs feeding finance reports to Snowflake and dbt. How do you plan it and prove parity?" |
| behavioral | "Tell me about a time…" + a sharp angle | "Tell me about a time you shipped data that turned out wrong. How did you find out, and what changed afterwards?" |
| leadership | Org tension + decision | "Two product teams want your platform team's next quarter, and you can fund one. How do you decide, and how do you tell the other?" |
| resume | Their claim → go 3 levels deep | "You wrote that you cut Spark costs 40%. Walk me through how you measured the baseline, and what you changed first." |

## Follow-up ladders (neutral probes)

Use at most 1–2 per question. Climb only if the answer holds up at the current rung.

1. **Clarify:** "What exactly do you mean by <vague term>?"
2. **Edge case:** "What if the same event arrives twice?" or "…arrives a day late?" Use this only if neither was addressed. Phrase it as a scenario, not a hint.
3. **Scale:** "What changes at 100× the volume?"
4. **Failure:** "It fails halfway through. What state are we in, and what do you do?"
5. **Verification:** "How do you know it's right in production?"
6. **Level up** (senior and above): "How would you roll this out across teams?" or "What would you do differently if you had to own this for 3 years?"

**Leading vs neutral:** a probe is leading if it names the missing technique or implies the answer is wrong. "Have you thought about watermarks?" is leading. "What happens to an event that arrives 2 hours late?" is neutral: it's a scenario they should already have covered.
