# Mode: swot

Goal: an evidence-based SWOT for **this** candidate, at **this** company and level. Every point cites the question(s) or the resume line behind it. If a point would fit any candidate, cut it.

Aim for 2–4 points per quadrant. **Fewer real points beat padded ones.** If the evidence is thin (many skips or "idk"s), say so plainly. Don't invent strengths.

## Strengths

Things they **demonstrated in their answers**. Each point: what they showed, plus (Q#) and a short quote or paraphrase.
> - Thinks in failure modes: raised idempotent reruns before being asked (Q4: "make the load idempotent with a MERGE on event_id").

## Weaknesses

Gaps, shallow areas, and communication habits shown in the answers. Each one cites Q#.
> - Streaming correctness is shallow: no mention of watermarks or late events (Q6, Q9). Both answers assumed in-order data.
> - Jumps to a solution without clarifying requirements (Q2, Q5, Q7).

Treat skipped and "idk" questions as weaknesses, grouped by category: "No answer on 3 of 3 streaming questions (Q6, Q9, Q11)". Don't speculate about why.

## Opportunities

Resume experience or adjacent skills they **under-used**, which map onto this JD or company. These are angles to lean into.
> - The resume shows a Teradata → Snowflake migration, but it never came up in the system-design answer (Q8). It is direct evidence for the JD's "lead platform migrations" [JD].

Without a resume, base this on adjacent skills visible in the answers, and say the resume would sharpen it.

## Threats

The specific gaps most likely to sink **this** interview at **this** company and level.
> - Kafka is a JD must-have [JD], and both streaming answers were skipped (Q6, Q11). At a senior bar, this alone could fail the round.

Add 1–2 market or competition factors, labeled **[General]**.
> - [General] Senior DE loops increasingly include cost/FinOps questions.

With file access, write `swot.md` using `templates/swot.md`. Then continue to `modes/prep-plan.md`.
