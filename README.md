# Precedent

Helps a new First Nations consultation advisor find how similar permit referrals were handled before, and start a reply from that precedent instead of a blank page.

BCIT COMP 8800/8900 capstone (database option). Built on a **synthetic** dataset modelled on public consultation-issue categories. No real ministry or Nation data is used.

## Target scope

1. Store past referrals, Nations, issue categories and responses in a relational schema.
2. Classify responses by issue type and retrieve similar past precedent for a new referral.
3. Draft a suggested starting reply that cites the precedent it used. An advisor always reviews before anything is sent.

## Status

Planning complete (proposal stage). Build starts November 2026.

## Repo layout

```
data/       schema and synthetic data
docs/       proposal, design docs, ERD, data dictionary
tests/      automated tests
```

## Workflow

- Work is tracked in Jira (project key `PREC`). Every branch, commit and PR references its issue key.
- Branch names: `feature/PREC-15-schema`, `fix/PREC-41-null-nation`
- Commits: `PREC-15 add core relational schema`
- `main` is protected: changes land through pull requests with passing CI.
