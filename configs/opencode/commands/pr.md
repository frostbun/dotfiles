---
description: Commit & create PR
agent: build
---

Use the `git-conventions` skill to analyze changes and create conventional branch/commit/pr following the conventions defined there.

Git root directory: $1 (leave empty to use current directory)

## Context Gathering

Analyze the repository state at $1:
- Check current branch, changed files, and git diff
- Review the actual code changes to understand what was modified

## Analysis and Value Generation (Using git-conventions Skill)

Based on the changes and the git-conventions skill conventions:

1. **Determine change type** from git-conventions Types table (feat, fix, docs, refactor, chore, etc.)
2. **Identify scope** from affected file paths (module/component name)
3. **Generate `GENERATED_BRANCH_NAME`** following Branch Naming Conventions: `{type}/{brief-kebab-description}`
4. **Generate `GENERATED_COMMIT_MESSAGE`** following Conventional Commits format: `{type}(scope): description`

## Execute Workflow

Execute the following git commands silently (hide all output), substituting the generated values:

1. Create and checkout branch: `git -C "$1" checkout -b GENERATED_BRANCH_NAME`
2. Stage all changes: `git -C "$1" add -A`
3. Commit: `git -C "$1" commit -m "GENERATED_COMMIT_MESSAGE"`
4. Push to origin: `git -C "$1" push -u origin GENERATED_BRANCH_NAME`
5. Create PR: `(cd "$1" && gh pr create --title "GENERATED_COMMIT_MESSAGE" --body "")`

## Report Results

After completion, report only:
- Branch: `GENERATED_BRANCH_NAME`
- Commit: `GENERATED_COMMIT_MESSAGE`
- PR URL: (from gh pr create output)
