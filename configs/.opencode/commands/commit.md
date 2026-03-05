---
description: Commit & push
agent: build
---

Use the `git-conventions` skill to analyze changes and create a conventional commit following the conventions defined there.

Git root directory: $1 (leave empty to use current directory)

## Context Gathering

Analyze the repository state at $1:
- Check current branch, changed files, and git diff
- Review the actual code changes to understand what was modified

## Analysis and Value Generation (Using git-conventions Skill)

Based on the changes and the git-conventions skill conventions:

1. **Determine change type** from git-conventions Types table (feat, fix, docs, refactor, chore, etc.)
2. **Identify scope** from affected file paths (module/component name)
3. **Generate `GENERATED_COMMIT_MESSAGE`** following Conventional Commits format: `{type}(scope): description`

## Execute Workflow

Execute the following git commands silently (hide all output), substituting the generated values:

1. Stage all changes: `git -C "$1" add -A`
2. Commit: `git -C "$1" commit -m "GENERATED_COMMIT_MESSAGE"`
3. Push: `git -C "$1" push`

## Report Results

After completion, report only:
- Commit: `GENERATED_COMMIT_MESSAGE`
