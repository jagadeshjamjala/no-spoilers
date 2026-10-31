# Mode: intake

Goal: collect the setup in as few turns as possible, then confirm it. Ask conversationally, a few items per message. Fill in defaults rather than asking about everything.

## Steps

1. **Check for a profile.** If you can read files and `profile/me.md` exists, read it and say "Using your profile from `profile/me.md`." Don't ask for a resume.
2. **Ask for the required and high-value items in one message:**
   - Company and role title (required).
   - The JD, as pasted text or a URL. Optional, but it makes the questions much sharper. If you get a URL and can browse, fetch it. If you can't, ask them to paste the text.
   - A resume or a 3–5 line background summary. Optional but encouraged. Skip this if a profile was loaded.
   - Days until the real interview.
3. **Infer the rest, then state it for confirmation:**
   - **Target level** (junior / mid / senior / lead / manager). Infer it from the title, the JD's years and scope, and the resume. Say what you inferred and why in one clause, e.g. "Senior: the JD asks for 5+ years and owning pipeline design."
   - **Round type:** recruiter screen, SQL/coding, data modeling, pipeline / system design, cloud and tools deep-dive, behavioral, hiring manager, or full loop. Default: full loop.
   - **Number of questions:** default 8 for a single round, 12 for a full loop.
   - **Pacing:** one at a time (default) or all at once.
   - **Days until the interview:** if not given, assume 7 and say so.
4. **Lead and manager targets:** a full loop must include leadership and system-design questions (see `references/level-calibration.md`).
5. **Confirm.** Restate the setup in 3–4 lines and ask "Good to go, or change anything?" Example:

   > **Stripe · Senior Data Engineer · full loop · 12 questions, one at a time**
   > Level: senior (inferred from "5+ years, own the ledger pipelines" [JD]).
   > Background: 6 years DE, Teradata → Snowflake migration, Airflow, dbt.
   > Interview in 10 days. I'll research Stripe's public data stack next and label anything I assume.

6. On confirmation:
   - Save `setup.md` if you can write files (template: `templates/setup.md`).
   - Move to `modes/calibrate.md`.

## Edge cases

- **Only "Data Engineer at <company>", nothing else.** Proceed. Use defaults, infer mid level unless told otherwise, and note that the questions will lean on [Assumption]s.
- **Unknown or private company.** Tell the user, then rely on the JD and the industry domain.
- **A non-data role.** Say the skill is tuned for data roles. Offer to proceed with the closest role (e.g. backend → platform data engineer), or stop.
