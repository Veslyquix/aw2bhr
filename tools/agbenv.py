"""Run the agbcc toolchain from Windows, with the build flags taken from the Makefile.

Two problems this exists to solve.

The toolchain lives in WSL while the tools are Windows Python, so every compile
has to cross over. Doing that through a shell means quoting the repo path --
which contains a space -- correctly every time, and that has already broken one
vendored script (agbcc's install.sh, whose `[ -d "$1" ]` guard is quoted so it
passes, after which every unquoted `cp` fails). Passing the script as a single
argv element to subprocess removes the shell from the path entirely, so the
space stops mattering.

The flags are read out of the Makefile rather than copied into a constant. A
candidate compiled with flags that differ from the real build in any way will
not match, and the failure looks exactly like a bad decompilation -- the most
expensive kind of false negative there is. Parsing keeps the two in step.

    from agbenv import compile_c, assemble, run
"""

import os
import re
import shlex
import subprocess
import sys

import awlib

DISTRO = os.environ.get("AW2_WSL_DISTRO", "Ubuntu")
MAKEFILE = os.path.join(awlib.REPO, "Makefile")


def wsl_path(win_path):
    r"""D:\Codes and Projects\x -> /mnt/d/Codes and Projects/x"""
    p = os.path.abspath(win_path)
    drive, rest = os.path.splitdrive(p)
    if not drive:
        return p.replace("\\", "/")
    return "/mnt/" + drive[0].lower() + rest.replace("\\", "/")


REPO_POSIX = wsl_path(awlib.REPO) if os.name == "nt" else awlib.REPO


def run(script, timeout=900, cwd=None):
    """Run a bash script with the repo as the working directory.

    The script is handed to bash as one argument, so nothing in it is re-parsed
    by an intermediate shell.
    """
    root = cwd or REPO_POSIX
    full = "cd %s || exit 1\n%s" % (shlex.quote(root), script)
    argv = (["wsl", "-d", DISTRO, "-e", "bash", "-c", full]
            if os.name == "nt" else ["bash", "-c", full])
    # stdin must be detached. When this runs underneath the MCP server the
    # process's stdin is the JSON-RPC pipe, capture_output redirects only
    # stdout and stderr, and a child inheriting that pipe hangs indefinitely --
    # which looks like a slow compile rather than a deadlock.
    proc = subprocess.run(argv, capture_output=True, text=True,
                          timeout=timeout, errors="replace",
                          stdin=subprocess.DEVNULL)
    return proc.returncode, proc.stdout, proc.stderr


_VAR_RE_CACHE = {}


def makefile_var(name):
    """The value of a `NAME := ...` assignment, with $(...) refs expanded.

    Only the handful of variables the compile pipeline needs are resolvable;
    anything still unexpanded is left alone and will surface as a build error
    rather than being silently dropped.
    """
    if not _VAR_RE_CACHE:
        with open(MAKEFILE, encoding="utf-8", errors="replace") as fh:
            for ln in fh:
                m = re.match(r'^\s*(?:export\s+)?(\w+)\s*[:?]?=\s*(.*?)\s*$', ln)
                if m and m.group(1) not in _VAR_RE_CACHE:
                    _VAR_RE_CACHE[m.group(1)] = m.group(2)
    known = {
        "AGBCC_HOME": "tools/agbcc",
        "PREFIX": "arm-none-eabi-",
        "EXE": "",
        "BUILD_DIR": "build",
        "SRC_DIR": "src",
        "ASM_DIR": "asm",
    }
    value = known.get(name, _VAR_RE_CACHE.get(name, ""))
    for _ in range(5):
        expanded = re.sub(r'\$\((\w+)\)',
                          lambda m: known.get(m.group(1),
                                              _VAR_RE_CACHE.get(m.group(1), m.group(0))),
                          value)
        if expanded == value:
            break
        value = expanded
    return value.strip()


def flags():
    return {
        "CPPFLAGS": makefile_var("CPPFLAGS"),
        "CFLAGS": makefile_var("CFLAGS"),
        "ASFLAGS": makefile_var("ASFLAGS"),
        "CPP": makefile_var("CPP") or "arm-none-eabi-cpp",
        "AS": makefile_var("AS") or "arm-none-eabi-as",
        "STRIP": makefile_var("STRIP") or "arm-none-eabi-strip",
        "CC1": makefile_var("CC1") or "tools/agbcc/bin/agbcc",
    }


def compile_c(src, out_o, out_s=None, extra_cflags=""):
    """Compile one C file exactly as the Makefile's `$(BUILD_DIR)/%.o: %.c` does.

    The `.text/.align` line appended after agbcc and the `.gcc2_compiled.` strip
    are part of that recipe, not incidental -- omitting either changes the
    object and so changes whether a candidate is judged to match.
    """
    f = flags()
    out_s = out_s or (os.path.splitext(out_o)[0] + ".s")
    script = (
        'set -e\n'
        'mkdir -p "$(dirname {o})" "$(dirname {s})"\n'
        '{cpp} {cppflags} {src} | iconv -f UTF-8 -t CP932 | '
        '{cc1} {cflags} {extra} -o {s}\n'
        'printf ".text\\n\\t.align\\t2, 0\\n" >> {s}\n'
        '{as_} {asflags} {s} -o {o}\n'
        '{strip} -N .gcc2_compiled. {o}\n'
    ).format(
        cpp=f["CPP"], cppflags=f["CPPFLAGS"], src=shlex.quote(src),
        cc1=f["CC1"], cflags=f["CFLAGS"], extra=extra_cflags,
        s=shlex.quote(out_s), as_=f["AS"], asflags=f["ASFLAGS"],
        o=shlex.quote(out_o), strip=f["STRIP"])
    return run(script)


def assemble(src_s, out_o):
    """Assemble one .s exactly as the Makefile's asm rule does."""
    f = flags()
    script = ('set -e\nmkdir -p "$(dirname {o})"\n{as_} {asflags} {s} -o {o}\n'
              ).format(as_=f["AS"], asflags=f["ASFLAGS"],
                       s=shlex.quote(src_s), o=shlex.quote(out_o))
    return run(script)


def objdump(obj, extra="-d -r -z"):
    f = flags()
    return run("%sobjdump %s %s" % (makefile_var("PREFIX") or "arm-none-eabi-",
                                    extra, shlex.quote(obj)))


def self_test():
    """Prove the pipeline here is the same one the Makefile uses.

    Compiles src/proc.c through this module and compares the object with the
    one `make` produced. Byte equality is the only acceptable result: if these
    differ, every match verdict from this harness is untrustworthy, and the
    difference would otherwise show up as an unexplainable failure to match.
    """
    ref = os.path.join(awlib.REPO, "build", "src", "proc.o")
    if not os.path.exists(ref):
        print("error: build/src/proc.o missing -- run `make` first")
        return 1

    out = "build/selftest/proc.o"
    rc, so, se = compile_c("src/proc.c", out)
    if rc != 0:
        print("FAIL compile returned %d\n%s\n%s" % (rc, so[-2000:], se[-2000:]))
        return 1

    got = os.path.join(awlib.REPO, "build", "selftest", "proc.o")
    a, b = open(ref, "rb").read(), open(got, "rb").read()
    if a != b:
        first = next((i for i in range(min(len(a), len(b))) if a[i] != b[i]),
                     min(len(a), len(b)))
        print("FAIL objects differ at byte %d (make=%d bytes, harness=%d bytes)"
              % (first, len(a), len(b)))
        print("     the harness is not reproducing the real build's flags")
        return 1

    print("PASS  harness reproduces build/src/proc.o byte-for-byte (%,d bytes)"
          .replace("%,d", "{:,}").format(len(a)))
    print("      compile flags match the Makefile, so match verdicts are sound")
    return 0


if __name__ == "__main__":
    if "--flags" in sys.argv:
        for k, v in flags().items():
            print("%-9s %s" % (k, v))
        sys.exit(0)
    sys.exit(self_test())
