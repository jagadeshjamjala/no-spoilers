# SESSION SUMMARY block (for chats without file access)

Output this exactly as a fenced block at the end of the debrief (or on `pause` with `status: paused`). Keep it compact: one line per item. Question gists are one line each, never answers.

```
SESSION SUMMARY · no-spoilers v1
status: complete
company: <Company> | role: <Role> | level: <level> | round: <round> | date: <YYYY-MM-DD> | days_to_interview: <n>
verdict: <Not yet|Close|Ready> | avg: <x.x>
scores: sql=<x.x> modeling=<x.x> streaming=<x.x> ... (only categories tested)
open_weaknesses: <w1 (Q#)>; <w2 (Q#)>; ...
threats: <t1>; <t2>
plan: 1) <item> 2) <item> 3) <item>
asked: <date> sql "<gist>"; <date> streaming "<gist>"; ...
```

On `retake`, the user pastes this back; use `asked` to avoid repeats and `scores` for deltas.
