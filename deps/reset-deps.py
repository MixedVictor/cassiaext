#!/usr/bin/env python3

import sys
import os
import re
import subprocess

class Dependency:
    def __init__(self, name, tag):
        self.name = name
        self.tag = tag

# Read dependencies from README.md
script_dir = os.path.dirname(os.path.realpath(__file__))
with open(os.path.join(script_dir, "README.md"), "r") as readme:
    readme_lines = readme.readlines()
    start_line = -1
    for i in range(len(readme_lines)):
        if readme_lines[i].startswith("```"):
            start_line = i + 1
            break

    if (start_line == -1):
        print("Error: README.md is malformed")
        exit(1)

    deps = []
    for i in range(start_line, len(readme_lines)):
        line = readme_lines[i]
        if (line == "\n"):
            continue
        elif (line.startswith("```")):
            break
        # Eg: libXt - libXt-1.3.0
        res = re.search(r"([a-zA-Z0-9\.\-\_]+) - ([a-zA-Z0-9\.\-\_]+)", line)
        deps.append(Dependency(res.group(1), res.group(2)))

# Print dependencies
print("Dependencies:")
for dep in deps:
    if (dep.name == "gamescope"):
        continue
    else:
        print(f"* {dep.name} @ {dep.tag}")

# Ask for confirmation
if (input("Are you sure you want to reset all dependencies? (y/n) ") != "y"):
    exit(0)

# Reset all dependencies
for dep in deps:
    if (dep.name == "gamescope"):
        continue
    else:
        print(f"--- Resetting {dep.name} ---")
        status = subprocess.run(["git", "status", "-uno", "--porcelain=v1"], cwd=os.path.join(script_dir, dep.name), capture_output=True, text=True)
        if (status.returncode != 0):
            print(f"Error: Failed to check status for {dep.name}")
            exit(1)

        if (subprocess.run(["git", "log", "--oneline", f"{dep.tag}..HEAD"], cwd=os.path.join(script_dir, dep.name), capture_output=True, text=True).returncode != 0):
            print(f"Error: Failed to list commits for {dep.name}")
            exit(1)

        if (subprocess.run(["git", "reset", "--hard", dep.tag], stdout=sys.stdout, cwd=os.path.join(script_dir, dep.name)).returncode != 0):
            print(f"Error: Failed to reset {dep.name}")
            exit(1)

print("Done")
