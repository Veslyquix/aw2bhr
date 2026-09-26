---
name: decomp-wave
description: Coordinate or participate in a byte-matching decompilation batch in AW2:BHR.
---

# Preliminary decompilation protocol

These repository-local documents replace references to unpublished files on
an upstream contributor's computer. They summarize the checked-in AGENTS.md;
they do not reconstruct the missing protocol or add historical claims.

Read [AGENTS.md](../../AGENTS.md) for the repository boundaries, matching rules,
shared-file ownership, and full verification and integration gates. It remains
the authority for this preliminary protocol, subject to the user's instructions.
No unpublished instruction files are required for this workflow.

## Coordinator

- Confirm the concurrent matching-agent cap with the user for the batch.
- Inspect status and recent commits. Run tools/preflight.py and inspect the
  requested targets, existing drafts, parked entries, and compiler overrides.
- Write a brief using [brief-template.md](brief-template.md) and one exact,
  deduplicated target list. Assign non-overlapping batches using
  [agent-prompts.md](agent-prompts.md).
- After agents are idle, independently verify candidates with
  tools/verify_batch.py. A zero exit status is required for each promotion.
- Follow every integration gate in AGENTS.md, including prototype checks,
  regeneration, both ROM comparisons, reindexing, and final diff review.
- Report matches and remaining misses honestly; preserve useful residual
  evidence. Commit the scoped result locally. Never push.

## Matching agent

Read the brief and relevant code-generation notes. Start from existing drafts,
measure before editing, and check parked/asm-resident records. Follow the
per-function budget and compiler-profile rules in AGENTS.md. Leave candidates
in work/<fn>/<fn>.c and report exit status, remaining diff, and experiments.
Do not promote, regenerate integration state, or commit.

Use the project MCP tools when available. On Linux/WSL, the checked-in tools
also run directly with python3 (tools/agbenv.py supports this platform).
Unavailable MCP tools do not prevent using those same local scripts.
