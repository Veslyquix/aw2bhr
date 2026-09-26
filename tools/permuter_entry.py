#!/usr/bin/env python3
"""Run the vendored permuter with fork workers on Linux/WSL.

Python 3.14 defaults to forkserver, which needs a local socket bind. The
restricted WSL environment used for batch runs denies that bind, while fork
workers work normally. Set the method before importing the permuter.
"""

import multiprocessing
import runpy
import sys
from pathlib import Path


VENDOR = Path(__file__).resolve().parent.parent / "vendor" / "decomp-permuter"
sys.path.insert(0, str(VENDOR))
multiprocessing.set_start_method("fork")
runpy.run_path(str(VENDOR / "permuter.py"), run_name="__main__")
