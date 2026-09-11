# Agent skills

Project-level Agent Skills live in [`.agents/skills/`](../../.agents/skills/) (the same directory as `.claude/skills/`). Cursor and Claude Code both discover them from this path.

These skills encode UI craft, motion, and anti-slop conventions. When writing or reviewing frontend UI, apply the relevant skill instead of inventing visual defaults.

## Installed skills

Sources are pinned in [`skills-lock.json`](../../skills-lock.json).

### `emilkowalski/skills`

| Skill | Use when |
|-------|----------|
| `emil-design-eng` | General UI polish, component design, and animation taste. |
| `animate` | Building a web animation from scratch. |
| `animate-expo` | Building React Native / Expo motion. |
| `animation-vocabulary` | Naming a motion effect from a vague description. |
| `apple-design` | Gesture-driven UI, springs, sheets, and Apple-style motion on the web. |
| `ask-sonner` | Installing or debugging Sonner toasts. |
| `find-animation-opportunities` | Finding places that should (or should not) animate. Read-only. |
| `improve-animations` | Auditing existing motion and producing implementation plans. |
| `pick-ui-library` | Choosing a library instead of hand-rolling a common UI primitive. Explicit invoke only. |
| `prototype` | Building multiple UI variants behind a picker. Explicit invoke only. |
| `review-animations` | Reviewing animation code against a high craft bar. |
| `write-swift` | Writing or reviewing Swift. |

### `jakubkrehel/make-interfaces-feel-better`

| Skill | Use when |
|-------|----------|
| `make-interfaces-feel-better` | Polishing UI details: radius, type, shadows, icons, micro-interactions. |

### `yetone/kill-ai-slop`

| Skill | Use when |
|-------|----------|
| `kill-ai-slop` | Removing generic AI visual and copy tics from UI, landing pages, or docs. |

## Add or update skills

Install into this repository (not globally):

```sh
npx skills@latest add <owner/repo> --skill '*' -a cursor -y --copy
```

Refresh installed skills:

```sh
npx skills update
```

List what is installed:

```sh
npx skills list
```
