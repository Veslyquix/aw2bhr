# vendor/

Third-party tools, not committed. `vendor/` is gitignored: these are upstream
repositories with their own history, and vendoring them here would either bury a
second git tree inside this one or import thousands of files we never edit.
What *is* committed is this file, so the versions are recoverable.

## decomp-permuter

```sh
git clone https://github.com/WhenGryphonsFly/decomp-permuter-agbcc.git \
    vendor/decomp-permuter
```

Pinned at `1f7ef872b12f54db7678ff00e0346abc015410ae` (2025-06-27). This is the
ARMv4T/agbcc fork rather than upstream `simonlindholm/decomp-permuter`; the
difference that matters is `ARM32_SETTINGS` in `src/objdump.py`, without which
the scorer cannot read our objects at all.

Needs three Python packages, none of them installed by default:

```sh
wsl -d Ubuntu -u root -e bash -c \
    "apt-get install -y python3-pycparser python3-toml python3-levenshtein"
```

`python3-levenshtein` is only used by `--algorithm levenshtein`; the default is
difflib. The other two are required.

**If you don't have root** (no sudo password, `apt-get` unavailable), use a venv
under `vendor/` instead -- it survives a reboot same as `vendor/decomp-permuter`
itself, just not committed:

```sh
python3 -m venv vendor/permuter-venv
vendor/permuter-venv/bin/pip install "pycparser==2.22" toml python-Levenshtein
```

`pycparser==2.22` is pinned deliberately: the current release (3.00) dropped the
`pycparser.plyparser` module this permuter fork imports, so a plain
`pip install pycparser` breaks it with `ModuleNotFoundError: No module named
'pycparser.plyparser'`. `apt`'s `python3-pycparser` happens to package an
older version that still has it, which is why the apt route above doesn't need
this pin.

`tools/permute.py` invokes `python3 vendor/decomp-permuter/permuter.py` as a
bare shell command, so whichever `python3` is first on `PATH` is the one that
runs -- the venv is not picked up automatically. Put it first when using this
route:

```sh
PATH="$(pwd)/vendor/permuter-venv/bin:$PATH" python3 tools/permute.py <name> --seconds 300
```

Do not invoke `permuter.py` directly — `tools/permute.py` builds the input
directory, imposes a time limit, and re-checks every result with
`tools/trymatch.py`. The permuter scores by diffing objdump text, which is a
weaker test than byte equality, so its own score is a search signal and not a
verdict.
