# Data topic taxonomy

Use these category IDs (the `ID` column) everywhere: in question labels, category scores, and progress tracking. Each category lists the **subtopics** to draw questions from and the **signals** that separate strong from weak answers.

## Categories

| ID | Category | Subtopics | Strong-answer signals |
|---|---|---|---|
| `sql` | SQL | Window functions (ROW_NUMBER, LAG/LEAD, running totals, gaps-and-islands); joins (fan-out, anti/semi joins, NULL semantics); aggregation pitfalls (double counting, COUNT DISTINCT at scale); dedup; date and time-zone handling; query performance (predicate pushdown, partition pruning, clustering, avoiding cross joins, EXPLAIN plans) | States the grain before writing; handles NULLs and ties; checks for fan-out; knows when a query will scan everything |
| `modeling` | Data modeling | Kimball star schema (facts, dimensions, grain, conformed dims); SCD types 0/1/2/3/6; Data Vault (hubs, links, satellites) and when it's worth it; One Big Table vs star; normalization trade-offs; event vs snapshot facts; modeling for semi-structured data; semantic and metrics layers | Declares the grain first; picks the SCD type per attribute with a reason; thinks about how the model is queried and how it changes |
| `batch` | Batch ETL/ELT | ELT vs ETL; incremental loads (watermarks, CDC, MERGE/upsert); idempotency and reruns; backfills; late-arriving dimensions; schema evolution; file formats (Parquet, Avro, ORC) and partitioning | Designs for reruns and backfills from the start; distinguishes event time from load time |
| `spark` | Spark and distributed compute | Lazy evaluation, DAG, stages, shuffles; narrow vs wide transformations; partitioning and skew (salting, AQE); broadcast joins; caching; memory (executor, spill, OOM); small-files problem; reading the Spark UI | Explains *why* a job is slow from shuffles and skew; reaches for metrics before tuning knobs |
| `streaming` | Streaming | Kafka (topics, partitions, consumer groups, offsets, retention, compaction); delivery semantics (at-most-once, at-least-once, exactly-once) and idempotent sinks; event time vs processing time; watermarks, windows and late data; stateful processing; Flink, Spark Structured Streaming and Kafka Streams; CDC (Debezium); back-pressure | Separates "exactly-once" in the broker from end-to-end; has a plan for late and duplicate events; knows ordering is per partition |
| `warehouse` | Warehouses and lakehouses | Snowflake (warehouses, micro-partitions, clustering, time travel); BigQuery (slots, partitioning, clustering, cost per byte); Databricks / Delta Lake; Apache Iceberg (snapshots, hidden partitioning, compaction); Redshift; storage/compute separation; table maintenance | Knows how the engine prunes data and charges for it; picks the table layout from the query patterns |
| `orchestration` | Orchestration and transformation | Airflow (DAGs, sensors, retries, idempotent tasks, backfill, catchup, data-aware scheduling); dbt (models, incremental strategies, tests, snapshots, sources, exposures, CI); Dagster/Prefect; dependency management across teams | Tasks are idempotent and retry-safe; tests are part of the DAG; knows the backfill story |
| `quality` | Data quality and observability | Tests (uniqueness, not null, referential, accepted values, freshness, volume anomalies); data contracts; SLAs/SLOs; lineage; alerting without noise; incident triage; reconciliation against the source of truth | Detects problems before stakeholders do; quantifies "correct"; has an on-call story |
| `cost` | Cost and performance tuning | Warehouse sizing and auto-suspend; partitioning and clustering for pruning; materialization choices; Spark cluster sizing; storage tiers; FinOps attribution (tags, per-team cost) | Measures before optimizing; ties cost to query patterns; has numbers |
| `cloud` | Cloud platforms | AWS (S3, Glue, EMR, Kinesis, Redshift, IAM, Lake Formation); GCP (GCS, BigQuery, Dataflow, Pub/Sub, Dataproc, Composer); Azure (ADLS, Synapse, Data Factory, Event Hubs, Databricks); networking basics (VPC, private endpoints); IaC (Terraform) | Picks services from the requirements, not the brand; knows IAM, least privilege and the networking gotchas |
| `design` | Data system design | End-to-end pipeline design (sources → ingestion → storage → transform → serving); batch vs streaming vs lambda/kappa; capacity estimates; SLAs; multi-tenant platforms; replay and reprocessing; serving layers (OLAP stores, feature stores, reverse ETL) | Clarifies requirements and numbers first; draws the data flow; names failure modes and trade-offs; evolves the design |
| `governance` | Governance, security and PII | Access control (RBAC/ABAC, row and column security); PII handling (masking, tokenization, hashing pitfalls); GDPR/CCPA deletion requests in immutable storage; encryption; auditing; catalogs (Unity, DataHub, Glue Catalog) | Designs deletion and access in from the start; knows hashing is not anonymization |
| `migration` | Legacy migration | Teradata, Oracle, Netezza, Ab Initio, Informatica, SSIS → cloud; assessment and inventory; translating SQL dialects; parallel runs and parity validation; cutover strategy; decommissioning; stakeholder communication | Has a parity-validation plan with tolerances; phases the cutover; plans rollback |
| `behavioral` | Behavioral (STAR) | Conflict; failure and learning; ambiguity; prioritization; influencing without authority; mentoring; pushing back on a stakeholder; an incident they caused | Specific situation, own actions ("I", not "we"), measurable result, reflection |
| `leadership` | Leadership (Lead/Manager) | Roadmaps and prioritization; build vs buy; tech debt strategy; stakeholder management; hiring and the interview bar; performance management; incident command and postmortems; team topology; platform adoption; budgeting | Ties decisions to business outcomes; shows the trade-offs they owned; grows people; has metrics |
| `resume` | Resume probe | Any claim on the resume: a migration, a metric ("cut cost 40%"), "led", "designed" | Can go 3 levels deep on their own claim; the numbers hold up; owns the hard parts |

## Default weights by role archetype

Use these when there is no JD, and label them [Assumption]. Weights are relative.

| Archetype | Heaviest | Medium | Light |
|---|---|---|---|
| Data engineer (general) | sql, batch, modeling, design | spark, orchestration, quality, warehouse | streaming, cloud, governance, behavioral |
| Analytics engineer | sql, modeling, orchestration (dbt) | quality, warehouse, behavioral | cost, governance |
| Data analyst | sql, behavioral (stakeholders) | modeling (consuming), quality | warehouse |
| Platform / infra DE | design, cloud, spark, streaming | cost, governance, orchestration | modeling |
| ML data engineer | batch, spark, design (feature pipelines, point-in-time correctness) | streaming, quality | modeling |
| Lead DE | design, leadership, modeling | quality, cost, migration, behavioral | — |
| DE manager | leadership, behavioral, design (at a review level) | quality (SLAs), cost, governance | hands-on SQL (light) |

## Domain flavors (for scenarios)

| Domain | Scenario material |
|---|---|
| Fintech / payments | Double-entry ledger, idempotent payment events, refunds and disputes, FX, reconciliation with bank files, PCI scope |
| E-commerce | Clickstream sessions, carts, orders vs fulfilment, returns, attribution, inventory snapshots |
| Ride-hailing / logistics | Trip state machines, GPS pings, surge pricing, ETAs, driver supply |
| Ads / marketing | Impressions and clicks at scale, dedup, attribution windows, budgets and pacing |
| Healthcare / insurance | Claims lifecycle, members (SCD), HIPAA/PII, late adjudications |
| SaaS | Multi-tenant usage events, billing, MRR/churn metrics, product analytics |
| IoT / telemetry | Out-of-order device events, downsampling, time-series storage |
| Media / streaming | Watch events, sessions, content metadata, recommendations features |
