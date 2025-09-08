
---

## `functional_spec.md`

# Functional Specification — Lutong Bahay CLI

## Introduction
Lutong Bahay CLI is a terminal application that lets users browse Filipino recipes and follow them step-by-step while cooking. It solves the “phone-scrolling while hands are busy” problem by offering concise commands to navigate instructions.

## User Stories
- **As a home cook**, I want to **see a list of recipes** so that **I can pick something to cook**.
- **As a learner**, I want to **search by name or tag** so that **I can quickly find soups, noodles, or desserts**.
- **As a cook in progress**, I want to **go next/prev in steps** so that **I can follow instructions at my own pace**.
- **As a multitasker**, I want to **switch recipes any time** so that **I can compare options or pivot**.
- **As a user**, I want to **see ingredients** so that **I can verify I have everything**.

## Commands / UI
### Menu Mode
- `1`, `2`, ... — select recipe by list number
- `search <term>` — filter by name/tags
- `list` — reprint list
- `help` — show help
- `exit` — quit

### Step Mode
- `next` / `n` — next step
- `prev` / `p` — previous step
- `restart` — go to step 1
- `ingredients` / `ing` — show ingredients
- `list` — back to menu (keeps progress)
- `switch` — go to menu to pick another recipe
- `help` — show help
- `exit` — quit

## Data
- A `Recipe` has: `name`, `ingredients[]`, `steps[]`, `tags[]`.

## Non-Functional
- Simple, robust CLI (no external deps required).
- Testable components (MiniTest examples provided).

## Acceptance Criteria
- Running `bin/lutong_bahay` shows a recipe list.
- Selecting a recipe shows ingredients and step 1.
- `next`/`prev` navigate steps.
- `search` filters list by name/tags.
- `list` returns to the recipe menu.
- `exit` quits with a friendly message.
