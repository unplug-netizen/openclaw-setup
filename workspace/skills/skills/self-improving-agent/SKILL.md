---
name: self-improving-agent
description: A self-improving agent that analyzes its own performance, identifies weaknesses, and implements improvements to its workspace configuration, skills, and behavior patterns. Use when the agent needs to reflect on past interactions, optimize its setup, fix recurring issues, or evolve its capabilities through self-analysis and automated improvements.
---

# Self-Improving Agent

This skill enables the agent to analyze its own behavior, identify patterns, and implement improvements to become more effective over time.

## Core Capabilities

1. **Performance Analysis** - Review past interactions and identify what worked/didn't work
2. **Pattern Recognition** - Detect recurring issues, mistakes, or inefficiencies
3. **Workspace Optimization** - Improve SOUL.md, USER.md, AGENTS.md, TOOLS.md based on learnings
4. **Skill Enhancement** - Update or create skills based on repeated tasks
5. **Memory Maintenance** - Consolidate daily notes into long-term MEMORY.md

## When to Use

- After making the same mistake multiple times
- When tasks consistently take longer than expected
- When the user provides feedback about behavior
- During periodic self-review (heartbeat checks)
- After significant interactions that revealed gaps

## Workflow

### 1. Analyze Recent History

Review recent memory files and session logs:
- Read `memory/YYYY-MM-DD.md` for today and past days
- Look for patterns in mistakes or inefficiencies
- Note user feedback or corrections

### 2. Identify Improvement Areas

Common categories:
- **Communication style** - Too verbose? Too terse? Wrong tone?
- **Tool usage** - Using wrong tools? Missing available tools?
- **Knowledge gaps** - Repeatedly searching for same info?
- **Process inefficiencies** - Redundant steps? Slow workflows?
- **Configuration issues** - Wrong settings? Missing integrations?

### 3. Implement Improvements

Update relevant files:
- `SOUL.md` - Core behavior, personality, boundaries
- `USER.md` - User preferences, context, important details
- `AGENTS.md` - Session startup procedures, conventions
- `TOOLS.md` - Environment-specific notes, shortcuts
- `MEMORY.md` - Long-term learnings, distilled wisdom
- Skills - Create or improve skills for repeated tasks

### 4. Validate Changes

- Test that changes don't break existing behavior
- Ensure new patterns are actually used
- Document what was changed and why

## Self-Review Checklist

Run this periodically (e.g., weekly):

```markdown
## Self-Review: YYYY-MM-DD

### What went well this week?
- 

### What could be better?
- 

### Recurring issues noticed?
- 

### User feedback received?
- 

### Changes made?
- 

### Skills created/improved?
- 
```

## Memory Consolidation

Every few days, review daily notes and update MEMORY.md:

1. Read recent `memory/YYYY-MM-DD.md` files
2. Extract significant events, decisions, lessons
3. Update MEMORY.md with distilled learnings
4. Remove outdated info that's no longer relevant

## Creating Skills from Patterns

When you notice yourself doing the same complex task repeatedly:

1. Document the workflow in a new skill
2. Create helper scripts if needed
3. Add to `~/.openclaw/workspace/skills/skills/`
4. Test the skill on next occurrence

## Example Improvements

### Communication
- **Issue**: Too verbose responses
- **Fix**: Update SOUL.md with "Be concise when possible"

### Tool Usage  
- **Issue**: Forgetting to use `memory_search` before answering
- **Fix**: Add reminder to AGENTS.md startup sequence

### Knowledge
- **Issue**: Repeatedly looking up user's tech stack
- **Fix**: Add to USER.md under Context section

## Notes

- Start small - one improvement at a time
- Document why changes were made
- Test changes before assuming they work
- Not everything needs fixing - some friction is normal
