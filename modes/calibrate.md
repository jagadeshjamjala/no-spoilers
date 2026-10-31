# Mode: calibrate

Goal: decide **what** to ask and **how hard**. Show the user a short calibration summary, but never the questions' answers.

## Steps

1. **Parse the JD** (if one was given) into:
   - **Must-have skills**: required, "you have", "strong experience in".
   - **Nice-to-have skills**: "bonus", "preferred", "familiarity with".
   - **Scope signals**: team size, ownership words ("own", "lead", "define"), scale numbers, on-call, stakeholders.
2. **Map the skills onto `references/de-topic-taxonomy.md`** categories, and assign weights:
   - Must-have categories: 2× weight.
   - Nice-to-have categories: 1× weight.
   - Categories the round type requires (e.g. behavioral in a full loop): at least 1 question.
   - Without a JD, weight by the role archetype's defaults in the taxonomy and label them [Assumption].
3. **Research the company** following `references/company-research.md`:
   - **With web tools:** look up the data stack, domain, scale, recent engineering blog posts, and the publicly reported interview format. Cite each source.
   - **Without web tools:** say "I can't browse, so company context is from the JD and labeled assumptions only."
   - Then pick a **domain flavor** for the scenarios (payments ledger, clickstream, ride events, ad impressions, claims, IoT telemetry, …).
4. **Use the resume:**
   - **Probe-worthy claims:** big migrations, "reduced cost by X%", "led", "designed". Plan at least one resume-probe question, e.g. "You migrated Teradata to Snowflake. Walk me through cutover and how you proved parity."
   - **Gaps:** JD must-haves with no resume evidence. Plan questions there, because real interviewers will probe them too.
5. **Set the level bar** from `references/level-calibration.md`, and tell the user which bar you're holding them to.
6. **Show a calibration summary** of at most 10 lines:

   ```
   Focus (by JD weight): Streaming 25% · Data modeling 20% · SQL 20% · System design 15% · Behavioral 10% · Resume probe 10%
   Company context: Payments, high-volume event data [Public, stripe.com/blog/...]; Spark + Airflow mentioned [JD]; uses Iceberg [Assumption]
   Domain flavor: payments ledger / disputes
   Resume probes: Teradata→Snowflake cutover; "cut Spark cost 40%"
   Gaps to probe: Kafka (JD must-have, not on resume)
   Level bar: senior
   ```

   Never list the questions themselves here.
7. Move to `modes/interview.md`.
