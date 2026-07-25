#!/usr/bin/env python3

from pathlib import Path
import yaml
import sys

# ----------------------------------------
# Paths
# ----------------------------------------

ROOT = Path.home() / ".config/themes"

THEMES = ROOT / "themes"
TEMPLATES = ROOT / "templates"
OUTPUT = ROOT / "output"

# ----------------------------------------
# Read theme
# ----------------------------------------

if len(sys.argv) != 2:
    print("Usage: apply.py <theme>")
    sys.exit(1)

theme_name = sys.argv[1]
theme_file = THEMES / f"{theme_name}.yaml"

if not theme_file.exists():
    print(f"Theme '{theme_name}' not found.")
    sys.exit(1)

with open(theme_file, "r", encoding="utf-8") as f:
    theme = yaml.safe_load(f)

# ----------------------------------------
# Flatten nested dictionaries
# Example:
# ui.bg0 -> "#ffffff"
# ----------------------------------------

colors = {}

def flatten(prefix, value):
    if isinstance(value, dict):
        for key, val in value.items():
            new_prefix = f"{prefix}.{key}" if prefix else key
            flatten(new_prefix, val)
    else:
        colors[prefix] = str(value)

flatten("", theme)

# ----------------------------------------
# Generate output
# ----------------------------------------

OUTPUT.mkdir(parents=True, exist_ok=True)

print(f"Applying theme: {theme_name}\n")

for template in sorted(TEMPLATES.iterdir()):

    if not template.is_file():
        continue

    text = template.read_text(encoding="utf-8")

    for key, value in colors.items():
        text = text.replace(f"{{{{ {key} }}}}", value)

    output_file = OUTPUT / template.name
    output_file.write_text(text, encoding="utf-8")

    print(f"✓ {template.name}")

print("\nDone!")
