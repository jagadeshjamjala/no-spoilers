# Level calibration: what "good" sounds like

Hold answers to the bar of the **target** level. An answer that would be a strong mid-level answer can be a 2 on level fit for senior.

| Level | Scope they're hired for | A good answer sounds like | Red flags at this level |
|---|---|---|---|
| **Junior** (0–2 yrs) | Well-defined tasks with review | Correct SQL and code; asks clarifying questions; explains what each step does; honest about limits | Guessing confidently; can't explain their own code |
| **Mid** (2–5 yrs) | Owns pipelines end to end | Correct, plus handles edge cases (NULLs, dupes, late data, reruns); knows one or two alternatives; tests and monitoring come up unprompted | Happy path only; no idea how it fails in production |
| **Senior** (5+ yrs) | Owns systems; designs for others | Starts with requirements and numbers; compares 2–3 options with trade-offs; designs for failure, backfill, cost and evolution; real war stories with numbers | Tool-name dropping without "why"; one-size answers; no operational thinking |
| **Lead** | Sets the technical direction for a team or domain | Senior bar, plus: aligns the design with org constraints (team skills, budget, roadmap); sequences the migration or rollout; standards and reviews; decides under uncertainty and explains the reversibility | Designs as a solo hero; ignores adoption, people and migration path |
| **Manager** | Delivery, people, and the team's impact | Outcomes and metrics; prioritization frameworks they actually used; hiring and performance stories with specifics; incident leadership and blameless postmortems; can still review a design credibly | Generic leadership talk; "we" with no own actions; can't judge technical trade-offs |

## Level-specific question requirements

- **Lead targets:** at least 2 `design` questions at stretch depth (multi-team, migration path, platform adoption) and at least 2 `leadership` questions (technical direction, influencing, mentoring, incident command). The rubric's level fit for lead requires org-aware trade-offs.
- **Manager targets:** at least 3 `leadership` / `behavioral` questions (hiring, under-performance, prioritization conflict, stakeholder escalation) and 1 `design` review question ("Your senior proposes X. What do you ask?").
- **Junior targets:** no stretch system design. Use guided scenarios and more SQL fundamentals in realistic contexts.

## Same question, three levels

The question: "Daily revenue in the dashboard is 3% higher than finance's number. Investigate."

- **Mid (good):** compare the grain; check for join fan-out and duplicate events; check for time zone differences; reconcile on a sample day.
- **Senior (good):** the mid answer, plus: define the source of truth with finance; refunds and currency conversion timing; build an automated reconciliation test with tolerance and alerting so it doesn't recur.
- **Lead (good):** the senior answer, plus: own a metric definition in the semantic layer, add a data contract with the upstream payments team, and set a process so metric changes get finance sign-off.
