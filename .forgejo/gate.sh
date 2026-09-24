#!/bin/sh
# The CircuitBoardGames fork's gate: what the hub installs from this fork, not upstream's full
# suite (too heavy for the shared runner). Type-check, then every Bash test -- including the
# multi-script regression that the vendored tree-sitter-bash wasm exists to pass.
set -eu
npm ci --ignore-scripts --no-audit --no-fund
npx tsc --noEmit -p .
npx vitest run __tests__/extraction.test.ts __tests__/resolution.test.ts __tests__/sync.test.ts -t Bash
npx vitest run __tests__/upgrade.test.ts
