# Rubric: 1–4 per dimension

Score against the **target level** (see `level-calibration.md`). Don't use half points on individual dimensions; averages can be decimals.

Global rules:
- Skipped, "idk" or no answer: 1 on everything.
- Hint used: max 3 per dimension (shown as `3*`).
- Unverifiable claims don't earn real-world points by themselves. Specifics do.

## Correctness

| Score | Definition |
|---|---|
| 1 | Wrong, or no answer. The approach wouldn't work. |
| 2 | Partly right. The core idea is there, but a bug or gap would give wrong results (e.g. fan-out, missed duplicates, wrong grain). |
| 3 | Correct for the main case, with minor gaps in edge cases. |
| 4 | Correct, including the edge cases that matter here (NULLs, ties, duplicates, late data, reruns). |

## Depth & trade-offs

| Score | Definition |
|---|---|
| 1 | Names a tool or term with no reasoning. |
| 2 | Explains one approach, but no alternatives or why. Buzzwords without mechanics. |
| 3 | Compares at least one alternative with a sound reason; knows the main limitation of the chosen approach. |
| 4 | Weighs several options against the stated constraints (scale, cost, latency, team); says when they'd change their mind. |

## Structure & communication

| Score | Definition |
|---|---|
| 1 | Rambling or fragmentary; hard to follow; no clear answer. |
| 2 | Gets to an answer but jumps around; no clarifying questions where they were needed. |
| 3 | Clear flow: clarify → approach → detail. Mostly concise. |
| 4 | Crisp and structured: states assumptions, signposts, checks understanding, and summarizes. An interviewer could take notes easily. |

## Real-world signal

| Score | Definition |
|---|---|
| 1 | Purely textbook, or nothing. |
| 2 | Some practical awareness, but generic ("add monitoring"). |
| 3 | Specific operational details: failure modes, monitoring, rough numbers, or a relevant experience. |
| 4 | Clearly lived it: concrete war stories, numbers, what went wrong, and what they'd do differently. |

## Level fit

| Score | Definition |
|---|---|
| 1 | Well below the target level. |
| 2 | One level below the target (e.g. a solid mid-level answer for a senior role). |
| 3 | Meets the target-level bar. |
| 4 | Above the bar; would stand out at this level. |

## Question score

Question score = the mean of the five dimensions, to one decimal place.
