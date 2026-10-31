# Sample session (end to end)

A worked run against `examples/sample-jd-fintech-senior-de.md`. The company is fictional, so all company context comes from the [JD]. Condensed: 6 questions instead of 12.

---

## 1. Intake

**User:** Mock interview for Ledgerly, senior data engineer. JD is in examples/sample-jd-fintech-senior-de.md. Interview in 5 days. Background: 6 yrs DE in e-commerce, Spark + Airflow + Snowflake, migrated Teradata to Snowflake. Never used Kafka in prod.

**Coach:**
> **Ledgerly · Senior Data Engineer · full loop · 6 questions, one at a time** (you asked for a short run; the default is 12)
> Level: senior ("5+ years, owning production pipelines" [JD]).
> Background: 6 yrs DE in e-commerce; Spark, Airflow, Snowflake; Teradata → Snowflake migration; no production Kafka.
> Interview in 5 days. I can't browse here, so company context comes from the JD and labeled assumptions only.
>
> Good to go, or change anything?

**User:** go

## 2. Calibration

```
Focus (by JD weight): Modeling 2 · Streaming 1 · SQL 1 · Design 1 · Resume probe 1  (6 questions)
Company context: payments, 3M events/day, peak 1.5k/s [JD]; Kafka → Iceberg + Snowflake [JD]; SSIS → dbt/Airflow migration [JD]
Domain flavor: payments ledger, refunds, disputes
Resume probes: Teradata → Snowflake migration (maps to the SSIS migration [JD])
Gaps to probe: Kafka (must-have [JD], not in production per the user)
Level bar: senior
```

## 3. Interview

> Starting the interview. Commands: `hint`, `skip`, `repeat`, `pause`, `end`.
>
> **Q1 of 6 · Resume probe · warm-up**
> You migrated Teradata to Snowflake. Walk me through how you decided a job was ready to cut over.

**User:** We ran both in parallel for two weeks and compared row counts and sums of key amount columns per day. When they matched for 5 consecutive days, we switched the downstream reports and kept Teradata read-only for a month.

> Got it. What would you do if row counts matched but one report still differed?

**User:** I'd diff at the key level. Hash each row on the business key plus columns and do a full outer join to find the mismatches. Usually it was rounding or time zones.

> Thanks.
>
> **Q2 of 6 · SQL · core**
> `payment_attempts(attempt_id, payment_intent_id, merchant_id, status, created_at)`. Retries share a `payment_intent_id`. Finance says our daily success rate per merchant is inflated. Write the query for the true daily success rate.

**User:** just tell me what you'd write, I want to see the ideal version

> I'll hold the answer for the debrief so this stays a real rehearsal. You can:
> **(a)** attempt it, even partially (thinking out loud counts);
> **(b)** take a `hint` (logged, and lowers the max score for this question); or
> **(c)** `skip` (recorded as no answer, revealed in the debrief).

**User:** ok fine. I'd count successes divided by count(*) grouped by merchant and date… but per intent, not per attempt. So `count(distinct case when status='succeeded' then payment_intent_id end) / count(distinct payment_intent_id)`, grouped by merchant_id and date(created_at).

> Which date does an intent belong to if its attempts span midnight?

**User:** Hmm, probably the first attempt's date.

> Got it.
>
> **Q3 of 6 · Data modeling · core**
> Merchants can change their pricing plan mid-month, and finance needs historically accurate fee reports. Design the tables.

**User:** A merchant dimension with SCD type 2 on plan: valid_from, valid_to, is_current. A fee fact at the transaction grain that joins to the merchant version valid at the transaction time.

> What happens when finance asks to correct a plan change that was entered with the wrong date?

**User:** idk, I'd just update the row.

> Thanks.
>
> **Q4 of 6 · Streaming · core**
> Payment events reach Kafka from the payment service. Some arrive twice, and some up to 30 minutes late. Design how they land in an Iceberg table that finance reconciles daily.

**User:** hint

> Hint: think about what makes an event unique, and when a day can be considered complete.

**User:** Use event_id to dedupe with a MERGE into Iceberg. For late data, partition by event date and re-run the previous day's partition.

> When do you consider a day final for finance?

**User:** Maybe after an hour?

> Got it.
>
> **Q5 of 6 · Data modeling · stretch**
> Model refunds and disputes so that a merchant's balance on any past date can be reproduced exactly.

**User:** skip

> Recorded. Moving on.
>
> **Q6 of 6 · System design · core**
> Design the migration of 120 SSIS reconciliation packages to dbt + Airflow, without finance losing a single month-end close.

**User:** Inventory the packages and group them by the reports they feed. Migrate the low-risk ones first. Run old and new in parallel through at least one month-end close, with automated reconciliation at the key level, like I did on the Teradata migration, and a tolerance of 0 for amounts. Cut over per report family, with a rollback switch in Airflow. Train the team on dbt as we go.

> That's the interview. Moving to the debrief.

## 4. Evaluation

```
### Q1 · Resume probe · warm-up — 3.4 / 4
Correctness 4 · Depth 3 · Structure 3 · Real-world 4 · Level fit 3   (hint: n · skipped: n)
Strong: concrete parity criteria ("5 consecutive days"), key-level hash diff under the follow-up.
Missing: no mention of reconciling at month-end or business sign-off.
Model answer (senior): parity tiers (counts → aggregates → key-level diffs), explicit tolerances agreed with finance, a parallel run spanning a period close, a cutover checklist, a rollback plan, a read-only freeze, a decommission date.
Interviewer was listening for: measurable exit criteria · key-level diffing · stakeholder sign-off.
```

```
### Q2 · SQL · core — 2.6 / 4
Correctness 3 · Depth 2 · Structure 2 · Real-world 3 · Level fit 3
Strong: switched the grain from attempt to intent unprompted ("per intent, not per attempt").
Missing: date attribution was decided only when probed; refunds and partial captures not considered; no NULL handling for the rate.
Model answer (senior):
  WITH intents AS (
    SELECT payment_intent_id, merchant_id,
           MIN(created_at)::date AS intent_date,
           MAX(CASE WHEN status = 'succeeded' THEN 1 ELSE 0 END) AS succeeded
    FROM payment_attempts GROUP BY 1, 2)
  SELECT merchant_id, intent_date,
         AVG(succeeded::float) AS success_rate, COUNT(*) AS intents
  FROM intents GROUP BY 1, 2;
  Then explain the grain choice and the time zone (merchant-local vs UTC), and validate against finance's number for one day.
Interviewer was listening for: the grain stated first · intent-date attribution · validation against the source of truth.
```

```
### Q3 · Data modeling · core — 2.2 / 4
Correctness 3 · Depth 2 · Structure 2 · Real-world 2 · Level fit 2
Strong: SCD2 with valid_from/valid_to; fact joined on the version valid at transaction time.
Missing: retroactive corrections ("I'd just update the row") destroy auditability, and finance needs a bitemporal record (when it was true vs when we knew it).
Model answer (senior): an SCD2 plan dimension plus recorded_at/superseded_at (bitemporal); corrections insert new versions rather than updating; fee facts store the plan_version_id used at calculation time, plus a restatement process.
Interviewer was listening for: auditability · bitemporal thinking · how restatements reach finance.
```

```
### Q4 · Streaming · core — 2.0 / 4 (3* cap, hint used)
Correctness 2 · Depth 2 · Structure 2 · Real-world 2 · Level fit 2   (hint: y)
Strong: event_id dedupe via MERGE.
Missing: no watermark or explicit day-close policy ("maybe after an hour"); no consumer offset/commit story; MERGE cost on a large Iceberg table not considered.
Model answer (senior): idempotent writes keyed on event_id; a watermark (e.g. 30 min plus buffer) defining when a day is provisionally closed; late events after close go to a correction stream that triggers a restatement; commit offsets after a successful write (at-least-once plus an idempotent sink gives effectively-once); compaction schedule; a reconciliation check against payment-service totals.
Interviewer was listening for: delivery semantics · watermark/day-close policy · how late data reaches finance.
```

```
### Q5 · Data modeling · stretch — 1.0 / 4 (skipped)
Model answer (senior): an append-only ledger of balance-affecting entries (charge, refund, dispute_opened, dispute_won/lost, fee), each with an effective_at and recorded_at; the balance as of D is the sum of entries effective ≤ D (and recorded ≤ D for an "as known then" view); never update entries, only reverse them.
Interviewer was listening for: an append-only ledger · reversal entries · as-of queries.
```

```
### Q6 · System design · core — 3.4 / 4
Correctness 4 · Depth 3 · Structure 4 · Real-world 3 · Level fit 3
Strong: phased by report family, parallel run through a month-end close, zero tolerance for amounts, rollback switch; reused the Q1 experience.
Missing: no mention of SSIS logic hidden in stored procedures or package configs; no owner sign-off per report.
Model answer (senior): <omitted here for length; same structure as Q1 plus the dependency inventory and the hidden-logic audit>
```

| Category | Avg |
|---|---|
| resume | 3.4 |
| sql | 2.6 |
| modeling | 1.6 (Q3, Q5) |
| streaming | 2.0 |
| design | 3.4 |

Overall average: 2.4.

**Verdict: Not yet.** Migration and design are at the senior bar (Q1, Q6), but two must-have categories are below 2.5: ledger modeling (1.6; Q3, Q5) and streaming correctness (2.0; Q4).

## 5. SWOT

- **Strengths:** parity-driven migration thinking (Q1, Q6: "tolerance of 0 for amounts"); fixes the grain when prompted by the data (Q2).
- **Weaknesses:** immutable/ledger modeling (Q3 "just update the row"; Q5 skipped); late-data finality (Q4 "maybe after an hour"); states assumptions only when probed (Q2, Q4).
- **Opportunities:** the Teradata migration story maps directly onto the SSIS → dbt migration [JD]. Lead with it in the behavioral and design rounds.
- **Threats:** ledger-accurate modeling is the core of this role [JD], and a senior answer that updates financial rows in place could sink the modeling round. Kafka is a must-have [JD] with no production experience. [General] Fintech loops tend to probe auditability.

## 6. Prep plan (5 days)

1. **Append-only ledger modeling** (fixes Q3, Q5). Study: double-entry ledgers, reversal entries, bitemporal tables. Drill: model charges, refunds and disputes, then write the "balance as of date D" query in 20 min. Done when: you can explain why an UPDATE is wrong in a ledger in 2 sentences.
2. **Late data and day-close policy** (fixes Q4). Study: event vs processing time, watermarks, restatements. Drill: whiteboard Kafka → Iceberg with dedupe, watermark and a correction path in 10 min. Done when: you can say what happens to an event 2 hours late.
3. **Kafka delivery semantics** (gap). Study: consumer groups, offset commits, idempotent sinks. Gap script: "I haven't run Kafka in production; my streaming-adjacent work was <Spark incremental loads on clickstream> where I handled duplicates with <…>. With Kafka, I'd commit offsets after an idempotent write…" Mini project: a local Kafka (Docker) → DuckDB/Iceberg consumer with replay.

| Day | Focus |
|---|---|
| 1 | Item 1 |
| 2 | Item 2 |
| 3 | Item 3 + mini project |
| 4 | Grain-first SQL drills (Q2 habit) |
| 5 | Review + rest |

Resources: *Designing Data-Intensive Applications* (ch. 11, stream processing), *The Data Warehouse Toolkit* (SCDs), the official Apache Kafka and Apache Iceberg docs.

Come back with `retake` when you've worked through items 1–3.
