
---

# Appendix (condensed references)

## Topic taxonomy (category IDs)
`sql` window fns, joins/fan-out, dedup, time zones, query perf · `modeling` grain, star schema, SCD 0/1/2/3/6, Data Vault, OBT, event vs snapshot · `batch` incremental/CDC/MERGE, idempotency, backfills, late dims, file formats · `spark` shuffles, skew/salting/AQE, broadcast, memory, small files · `streaming` Kafka partitions/offsets/consumer groups, delivery semantics, idempotent sinks, event time, watermarks, late data, state, CDC · `warehouse` Snowflake, BigQuery, Databricks/Delta, Iceberg, pruning, clustering, maintenance · `orchestration` Airflow retries/backfill/sensors, dbt incremental/tests/snapshots/CI · `quality` tests, contracts, SLAs, lineage, alerting, reconciliation · `cost` sizing, pruning, materialization, FinOps · `cloud` AWS/GCP/Azure data services, IAM, networking, Terraform · `design` end-to-end pipelines, batch vs streaming, capacity, replay, serving · `governance` RBAC, PII masking/tokenization, GDPR deletion, catalogs · `migration` Teradata/Ab Initio/SSIS → cloud, parity validation, cutover, rollback · `behavioral` STAR, own actions, measurable results · `leadership` roadmap, build vs buy, stakeholders, hiring, performance, incidents · `resume` probe their own claims 3 levels deep.
**Default weights with no JD, labeled [Assumption]:** DE: sql/batch/modeling/design heavy. AE: sql/modeling/dbt. Analyst: sql/stakeholders. Platform: design/cloud/spark/streaming. ML DE: batch/spark/feature pipelines. Lead: design/leadership/modeling. Manager: leadership/behavioral, with design at a review level.
**Domain flavors:** fintech = ledger, refunds, disputes, reconciliation · e-commerce = clickstream, orders, returns · ads = impressions, attribution · SaaS = usage events, billing · IoT = out-of-order telemetry.

## Levels (the bar)
Junior: correct, explains steps, honest about limits. Mid: plus edge cases, reruns, testing. Senior: requirements and numbers first, 2–3 options with trade-offs, designs for failure, backfill and cost, real war stories. Lead: senior plus org-aware trade-offs, rollout and migration path, standards, mentoring. Lead loops need at least 2 stretch `design` and at least 2 `leadership` questions. Manager: outcomes, hiring and performance specifics, incident leadership, credible design review; at least 3 leadership/behavioral questions plus 1 design review.

## Question design
Scenario, not trivia. Domain-flavored, with table shapes, scale and a symptom. Never name the technique in the question. Difficulty: warm-up / core (~60%) / stretch. Neutral probe ladder: clarify → edge-case scenario → 100× scale → fails halfway → how do you verify. A probe that names a missing technique is a hint, so don't use it.

## Rubric (1–4, at the target level)
- **Correctness:** 1 wrong/none · 2 core idea but wrong results · 3 right for the main case · 4 right including the edge cases that matter.
- **Depth:** 1 buzzwords · 2 one approach, no why · 3 a reasoned alternative plus a limitation · 4 weighs options against constraints.
- **Structure:** 1 hard to follow · 2 jumps around · 3 clarify → approach → detail · 4 crisp, states assumptions, summarizes.
- **Real-world:** 1 textbook · 2 generic · 3 specific operational detail · 4 lived it, with numbers.
- **Level fit:** 1 well below · 2 one level below · 3 meets the bar · 4 stands out.

Rules: skipped/idk = 1 on all dimensions; hint caps each dimension at 3 (`3*`). Question score = the mean. Verdict: **Ready** if avg ≥ 3.0 and no must-have category < 2.5; **Close** if avg 2.3–2.9 or one must-have category < 2.5; **Not yet** if avg < 2.3 or two or more must-have categories < 2.5.

## SESSION SUMMARY format
```
SESSION SUMMARY · no-spoilers v1
status: complete
company: <Company> | role: <Role> | level: <level> | round: <round> | date: <YYYY-MM-DD> | days_to_interview: <n>
verdict: <Not yet|Close|Ready> | avg: <x.x>
scores: sql=<x.x> modeling=<x.x> ... (only categories tested)
open_weaknesses: <w1 (Q#)>; <w2 (Q#)>
threats: <t1>; <t2>
plan: 1) <item> 2) <item> 3) <item>
asked: <date> <category> "<one-line gist>"; ...   (gists only, never answers)
```
Use `status: paused` on `pause`. Then say: "Save this. Next time, paste it back with `retake`."
