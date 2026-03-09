---
name: git-conventions
description: Git conventions for SSH cloning, conventional commit messages, and branch naming. Use when working with git repositories.
---

## SSH Cloning

- **Use SSH for cloning** (e.g. `git clone git@github.com:org/repo.git`)

## Conventional Commits

### Format
```
<type>[optional scope]: <description>

[optional body]

[optional footer(s)]
```

### Types

| Type | Description |
|------|-------------|
| `feat` | New feature |
| `fix` | Bug fix |
| `docs` | Documentation only changes |
| `style` | Code style (formatting, semicolons, etc.) |
| `refactor` | Code refactoring |
| `perf` | Performance improvements |
| `test` | Adding or correcting tests |
| `build` | Build system or dependencies |
| `ci` | CI/CD changes |
| `chore` | Other changes (configs, tooling) |
| `revert` | Reverting previous commits |

### Scope (Optional)

Provides context about the affected code section:
```
feat(api): add user authentication
fix(parser): resolve null pointer exception
```

### Breaking Changes

Indicate with `!` after type/scope:
```
feat(api)!: remove deprecated endpoints

feat!: change API response format
```

### Examples

```
feat: add user login functionality

fix(auth): correct token validation bug

docs: update API documentation

refactor(parser): simplify token parsing logic

feat!: remove support for Node 10
```

## Branch Naming Conventions

| Pattern | Use Case |
|---------|----------|
| `feature/description` or `feat/description` | New features |
| `fix/description` | Bug fixes |
| `hotfix/description` | Critical production fixes |
| `release/version` | Release branches |
| `docs/description` | Documentation changes |
| `refactor/description` | Code refactoring |
| `chore/description` | Maintenance tasks |

**Examples:**
- `feature/user-authentication`
- `fix/memory-leak`
- `hotfix/critical-security-patch`
- `release/v2.1.0`
