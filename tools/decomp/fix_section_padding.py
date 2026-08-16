import json
import os
import struct
import sys


def patch(obj_path, expected_size):
    with open(obj_path, 'r+b') as f:
        data = bytearray(f.read())

        # ELF32 header
        assert data[0:4] == b'\x7fELF'
        e_shoff = struct.unpack_from('<I', data, 0x20)[0]
        e_shentsize = struct.unpack_from('<H', data, 0x2E)[0]
        e_shnum = struct.unpack_from('<H', data, 0x30)[0]
        e_shstrndx = struct.unpack_from('<H', data, 0x32)[0]

        def shdr(i):
            off = e_shoff + i * e_shentsize
            name, typ, flags, addr, offset, size, link, info, align, entsize = \
                struct.unpack_from('<10I', data, off)
            return off, name, typ, flags, addr, offset, size, link, info, align, entsize

        strtab_off = shdr(e_shstrndx)[5]  # sh_offset of shstrtab

        def sec_name(name_off):
            end = data.index(b'\x00', strtab_off + name_off)
            return data[strtab_off + name_off:end].decode()

        text_idx = None
        for i in range(e_shnum):
            off, name, typ, flags, addr, offset, size, link, info, align, entsize = shdr(i)
            if sec_name(name) == '.text':
                text_idx = i
                text_shdr_off = off
                text_size = size
                text_align = align
                break
        if text_idx is None:
            raise SystemExit(f"no .text section in {obj_path}")

        if text_size == expected_size:
            return 'ok'
        if text_size < expected_size:
            raise SystemExit(f"{obj_path}: actual size {text_size} < expected {expected_size}!")

        diff = text_size - expected_size
        if diff not in (2, 4):
            raise SystemExit(f"{obj_path}: unexpected padding diff {diff} (actual {text_size}, expected {expected_size})")

        # verify the trailing bytes about to be dropped are a NOP-only pad (0x46c0 repeated,
        # or plain zero fill) before truncating, as a safety check
        text_file_off = shdr(text_idx)[5]
        tail = data[text_file_off + expected_size: text_file_off + text_size]
        ok_tail = tail == b'\xc0\x46' * (diff // 2) or tail == b'\x00' * diff
        if not ok_tail:
            raise SystemExit(f"{obj_path}: refusing to trim, unexpected tail bytes {tail.hex()}")

        # patch sh_size (offset 20 within shdr) down to expected_size
        struct.pack_into('<I', data, text_shdr_off + 20, expected_size)
        # patch sh_addralign (offset 32) down to 2 (thumb code min alignment)
        struct.pack_into('<I', data, text_shdr_off + 32, 2)

        f.seek(0)
        f.write(data)
        f.truncate()
        return f'trimmed {diff} bytes'

if __name__ == '__main__':
    # Splitting one giant nonmatching asm blob into one file per function (so individual
    # functions can be pulled out and matched without hand-editing a huge file) means each
    # function is now its own assembler invocation. GNU as pads a section's end to match
    # its own alignment requirement (raised to 4 by the thumb_func_start/.align a function
    # already uses for its leading alignment or any internal literal pool), which the
    # monolithic file never needed since consecutive functions just flowed into each other.
    # That extra trailing NOP shifts every following function's address. Fix it up here by
    # trimming back to the true byte length, computed from consecutive functions' addresses
    # in manifest_json (see tools/decomp/make_nonmatching_manifest.py).
    manifest_path, obj_path = sys.argv[1], sys.argv[2]
    with open(manifest_path) as f:
        manifest = json.load(f)
    src_name = os.path.splitext(os.path.basename(obj_path))[0] + '.s'
    expected_size = manifest[src_name]
    result = patch(obj_path, expected_size)
    print(f"{obj_path}: {result}")
