#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")/.."

test -f deploy/bin/fleet-daemon
test -f deploy/systemd/fleet-daemon.service
test -f deploy/systemd/fleet-daemon.timer
test -f docs/maturity.md
test -f resources/fleet/fixtures/kotoba-compiled-fact.wasm
bash deploy/bin/fleet-daemon --help >/dev/null
! bash deploy/bin/fleet-daemon 2>/dev/null
grep -q 'Type=oneshot' deploy/systemd/fleet-daemon.service
grep -q 'OnUnitActiveSec=' deploy/systemd/fleet-daemon.timer
echo "fleet packaging validation passed"

