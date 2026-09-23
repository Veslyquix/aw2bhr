#!/usr/bin/env bash
set -euo pipefail

repo_dir="$(cd "$(dirname "$0")/.." && pwd)"
ghidra_dir="$repo_dir/vendor/ghidra_12.1.3_PUBLIC"
jdk_dir="$repo_dir/vendor/jdk-25.0.4.1+1"

if [[ ! -x "$jdk_dir/bin/java" || ! -x "$ghidra_dir/support/analyzeHeadless" ]]; then
    echo "Ghidra or JDK 25 is missing from vendor/. See vendor/README.md." >&2
    exit 2
fi

export JAVA_HOME="$jdk_dir"
export XDG_CONFIG_HOME="$repo_dir/vendor/.ghidra-config"
export XDG_CACHE_HOME="$repo_dir/vendor/.ghidra-cache"

mode="${1:-}"
case "$mode" in
    headless)
        shift
        exec "$ghidra_dir/support/analyzeHeadless" "$@"
        ;;
    gui)
        shift
        exec "$ghidra_dir/ghidraRun" "$@"
        ;;
    *)
        echo "usage: bash tools/ghidra.sh {headless|gui} [Ghidra arguments]" >&2
        exit 2
        ;;
esac
