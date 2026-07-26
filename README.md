# fleet

Durable T6 placement for Kotoba tenders: multi-tenant leases, budgets,
checkpoints, recovery, audit records, and epoch fencing.

`fleet` decides **where and when** a bounded guest run is attempted. It calls
the `kototama` tender for execution, but does not define the tender, language
semantics, authority policy, or distributed consensus.

The persisted EDN schema intentionally retains `:kototama.fleet/*` keys so
checkpoints written before the split remain readable. Code ownership moved to:

- `fleet.core` — pure lease/budget/tick/checkpoint model
- `fleet.store` — memory, disk, B2, and composite persistence
- `fleet.fence` — shared-store epoch fencing (not Raft/Paxos)
- `fleet.exec` — placement-to-tender bridge and R3 acceptance gate
- `fleet.cli` — the ten fleet operational commands formerly in `kototama.cli`

```bash
clojure -M:test
clojure -M:cli fleet-demo
clojure -M:cli fleet-gate
bash deploy/staging-smoke.sh
```

See [docs/maturity.md](docs/maturity.md) for the exact R3 claim and operational
runbook.

