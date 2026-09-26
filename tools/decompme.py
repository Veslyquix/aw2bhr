#!/usr/bin/env python3
"""Prepare a function's assembly and current C draft for decomp.me.

Writes ``work/<function>/<function>.md`` with assembly as the first fenced
block and the relevant declarations plus current C source as the second.

    python tools/decompme.py sub_08013AEC
"""

import argparse
import json
import os
import re
import sys

import awlib
import newfunc


def _read(path):
    with open(path, encoding="utf-8", errors="surrogateescape") as fh:
        return fh.read()


def _fence(text):
    """Choose a Markdown fence longer than any run in the embedded text."""
    runs = [len(m.group(0)) for m in re.finditer(r"`+", text)]
    return "`" * max(3, max(runs, default=0) + 1)


def _symbols(text):
    return set(re.findall(r"\b[A-Za-z_][A-Za-z0-9_]*\b", text))


def _relevant_declarations(symbols):
    """Return declarations and type definitions for referenced symbols."""
    found = []
    type_blocks = []
    support_blocks = []
    include_dir = os.path.join(awlib.REPO, "include")
    for root, dirs, files in os.walk(include_dir):
        dirs.sort()
        for filename in sorted(files):
            if not filename.endswith(".h"):
                continue
            path = os.path.join(root, filename)
            lines = awlib.read_lines(path)
            # Remove comments before looking for declaration lines. Searching
            # raw headers let identifiers mentioned in prose masquerade as
            # declarations, and could emit fragments of multi-line comments.
            text = re.sub(r"/\*.*?\*/", "", "".join(lines), flags=re.S)
            text = "\n".join(line.split("//", 1)[0] for line in text.splitlines())
            # Pull complete tagged struct definitions needed by the source or
            # by one of the selected declarations.
            for match in re.finditer(r"\bstruct\s+([A-Za-z_]\w*)\s*\{", text):
                tag = match.group(1)
                if tag not in symbols:
                    continue
                opening = text.find("{", match.start())
                depth = 0
                end = opening
                for end in range(opening, len(text)):
                    if text[end] == "{":
                        depth += 1
                    elif text[end] == "}":
                        depth -= 1
                        if depth == 0:
                            end += 1
                            while end < len(text) and text[end] in " \t\r\n":
                                end += 1
                            if end < len(text) and text[end] == ";":
                                end += 1
                            type_blocks.append(text[match.start():end].strip())
                            break
            # Include typedefs such as ProcPtr when the draft uses them. The
            # integer aliases and ABS/STRUCT_PAD are provided by the user's
            # permanent decomp.me context, so do not repeat those here.
            typedef_text = ""
            for line in text.splitlines(keepends=True):
                clean = line
                if not typedef_text and not clean.lstrip().startswith("typedef "):
                    continue
                typedef_text += clean
                if ";" not in clean:
                    continue
                alias_match = re.search(r"([A-Za-z_]\w*)\s*;\s*$", typedef_text)
                if alias_match and alias_match.group(1) in symbols and alias_match.group(1) not in {
                        "u8", "u16", "u32", "u64", "s8", "s16", "s32", "s64",
                        "vu8", "vu16", "vu32", "vu64", "vs8", "vs16", "vs32", "vs64",
                        "s88", "s816", "s832", "ushort", "uint", "f32", "f64", "bool8"}:
                    type_blocks.append(typedef_text.strip())
                typedef_text = ""
            for line in text.splitlines():
                code = line.strip()
                if not code.endswith(";") or code.startswith(("#", "typedef", "static")):
                    continue
                if code.startswith("extern "):
                    # Extern function-pointer variables have a parenthesis
                    # before their name; ordinary globals end in `name;`.
                    match = re.search(r"\(\s*\*\s*([A-Za-z_]\w*)", code)
                    if not match:
                        match = re.search(r"\b([A-Za-z_]\w*)\s*(?:\[[^]]*\]\s*)?;$", code)
                else:
                    # Exclude function-pointer fields and other parenthesized
                    # declarations: only collect actual function prototypes.
                    match = re.match(
                        r"(?:[A-Za-z_]\w*\s+|struct\s+[A-Za-z_]\w*\s+|"
                        r"[A-Za-z_]\w*\s*\*+\s*)([A-Za-z_]\w*)\s*\([^;]*\);$",
                        code)
                if match and match.group(1) in symbols:
                    found.append(code)
    # Selected globals and prototypes can introduce struct tags that were not
    # named directly in the draft (for example `gMap` requires `struct Map`).
    dependency_tags = set(re.findall(r"\bstruct\s+([A-Za-z_]\w*)",
                                     "\n".join(found)))
    if dependency_tags:
        for root, dirs, files in os.walk(include_dir):
            dirs.sort()
            for filename in sorted(files):
                if not filename.endswith(".h"):
                    continue
                path = os.path.join(root, filename)
                text = _read(path)
                text = re.sub(r"/\*.*?\*/", "", text, flags=re.S)
                text = "\n".join(line.split("//", 1)[0]
                                 for line in text.splitlines())
                for match in re.finditer(r"\bstruct\s+([A-Za-z_]\w*)\s*\{", text):
                    if match.group(1) not in dependency_tags:
                        continue
                    opening = text.find("{", match.start())
                    depth = 0
                    for end in range(opening, len(text)):
                        if text[end] == "{":
                            depth += 1
                        elif text[end] == "}":
                            depth -= 1
                            if depth == 0:
                                end += 1
                                while end < len(text) and text[end] in " \t\r\n":
                                    end += 1
                                if end < len(text) and text[end] == ";":
                                    end += 1
                                type_blocks.append(text[match.start():end].strip())
                                break
    # Struct members can depend on small enum constants or macros declared
    # beside the type. Include those definitions when the copied type uses them.
    type_names = set(re.findall(r"\b[A-Z][A-Z0-9_]+\b", "\n".join(type_blocks)))
    if type_names:
        for root, dirs, files in os.walk(include_dir):
            dirs.sort()
            for filename in sorted(files):
                if not filename.endswith(".h"):
                    continue
                path = os.path.join(root, filename)
                text = _read(path)
                text = re.sub(r"/\*.*?\*/", "", text, flags=re.S)
                text = "\n".join(line.split("//", 1)[0]
                                 for line in text.splitlines())
                for match in re.finditer(
                        r"\benum(?:\s+[A-Za-z_]\w*)?\s*\{[^}]*\}\s*;", text, re.S):
                    if any(re.search(r"\b%s\b" % re.escape(name), match.group(0))
                           for name in type_names):
                        support_blocks.append(match.group(0).strip())
                for line in text.splitlines():
                    match = re.match(r"\s*#\s*define\s+([A-Za-z_]\w*)\b", line)
                    if match and match.group(1) in type_names:
                        support_blocks.append(line.strip())

    # Keep source order while removing declarations repeated through headers.
    types = list(dict.fromkeys(support_blocks + type_blocks))
    declarations = list(dict.fromkeys(found))
    return types + declarations


def prepare(name):
    with open(os.path.join(awlib.DATA_DIR, "functions.json"), encoding="utf-8") as fh:
        records = json.load(fh)
    key = name.strip().lower()
    rec = next((r for r in records
                if r["name"].lower() == key or r["addr_hex"].lower() == key), None)
    if rec is None:
        print("error: no function %r in the index" % name, file=sys.stderr)
        return 1

    fn = rec["name"]
    work_dir = os.path.join(awlib.REPO, "work", fn)
    asm_path = os.path.join(work_dir, "target.s")
    if not os.path.isfile(asm_path):
        print("error: %s is missing; create its work directory with tools/newfunc.py first"
              % os.path.relpath(asm_path, awlib.REPO), file=sys.stderr)
        return 1
    asm = _read(asm_path)

    c_path = os.path.join(work_dir, fn + ".c")
    if os.path.isfile(c_path):
        source = _read(c_path)
        # The destination does not have this repository's include tree. The
        # declarations and types needed for this function are emitted below.
        source = re.sub(r"^\s*#\s*include\s*[<\"].*[>\"]\s*$", "",
                        source, flags=re.M)
    else:
        parsed = None
        for af in awlib.load_all():
            parsed = next((f for f in af.funcs if f.name == fn), None)
            if parsed:
                break
        if parsed is None:
            print("error: %s not found in asm/*.s" % fn, file=sys.stderr)
            return 1
        n_args, returns = newfunc.infer_signature(parsed)
        source = newfunc.stub(fn, rec, n_args, returns)
        source = re.sub(r"^\s*#\s*include\s*[<\"].*[>\"]\s*$", "",
                        source, flags=re.M)

    source_symbols = _symbols(source)
    referenced = set(rec.get("calls", [])) | set(rec.get("data_refs", []))
    # Add functions called by the draft and any header-declared symbols it
    # names. Header scanning matches the declared identifier itself, so common
    # C tokens such as `int` or `struct` cannot pull in unrelated declarations.
    referenced.update(re.findall(r"\b([A-Za-z_]\w*)\s*\(", source))
    referenced.update(source_symbols)
    declarations = _relevant_declarations(referenced)
    if declarations:
        source = "/* Relevant declarations from include/*.h */\n" + "\n".join(declarations) + "\n\n" + source

    asm_fence = _fence(asm)
    c_fence = _fence(source)
    markdown = (
        "# %s\n\n" % fn
        + "## Assembly\n\n%sasm\n%s\n%s\n\n" % (asm_fence, asm.rstrip("\n"), asm_fence)
        + "## Source and relevant declarations\n\n%sc\n%s\n%s\n" % (c_fence, source.rstrip("\n"), c_fence)
    )
    out_path = os.path.join(work_dir, fn + ".md")
    awlib.write_text(out_path, markdown)
    print("wrote %s" % os.path.relpath(out_path, awlib.REPO))
    print("  assembly: %s" % os.path.relpath(asm_path, awlib.REPO))
    print("  source: %s" % (os.path.relpath(c_path, awlib.REPO)
                           if os.path.isfile(c_path) else "generated stub"))
    print("  relevant declarations: %d" % len(declarations))
    return 0


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("name", help="function name or address")
    args = parser.parse_args()
    return prepare(args.name)


if __name__ == "__main__":
    sys.exit(main())
