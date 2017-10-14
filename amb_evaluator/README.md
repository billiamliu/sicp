Based on SICP 4.1.7's syntax analysed version of the metacircular evaluator.

Execution of the amb evaluator takes three arguments: `env`, `sucesss proc` `failure proc`.

- The `success` branch of evaluation continues for as long as it receives a value.
- The `failure` branch is triggered when a deadend is reached (or when `try-again` is issued). It then backtracks.

**Failure continuations are constructed by:**
- **amb expressions** if the current choice made by the amb expression leads to a dead end, consider anternative
- **top-level driver** report failure when choices are exhausted
- **assignments** undo assignments during backtracking
