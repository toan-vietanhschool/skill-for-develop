#!/usr/bin/env bash
# install.sh — Quick setup script for Skill For Develop
set -euo pipefail

echo "=== Skill For Develop — Installer ==="
echo ""

# Step 1: Copy project-level skills
echo "[1/3] Setting up project-level skills..."
if [ -d ".claude/skills" ]; then
    echo "  ✓ .claude/skills/ already exists"
else
    echo "  ✗ .claude/skills/ not found — are you in the repo root?"
    exit 1
fi

# Step 2: Install ECC globally
echo ""
echo "[2/3] Installing Everything Claude Code (global)..."
if [ -d "everything-claude-code" ]; then
    cd everything-claude-code
    if [ ! -d "node_modules" ]; then
        echo "  Installing npm dependencies..."
        npm install --no-audit --no-fund --loglevel=error
    fi
    echo "  Running ECC installer..."
    bash install.sh --profile developer --target claude
    cd ..
    echo "  ✓ ECC installed to ~/.claude/"
else
    echo "  ✗ everything-claude-code/ not found — skipping"
fi

# Step 3: Verify
echo ""
echo "[3/3] Verifying installation..."
echo ""

skills_count=$(find .claude/skills -maxdepth 2 -name "SKILL.md" 2>/dev/null | wc -l)
echo "  Project-level skills: ${skills_count} SKILL.md files"

global_skills=$(ls ~/.claude/skills/ecc/ 2>/dev/null | wc -l)
echo "  Global ECC skills:    ${global_skills}"

global_rules=$(ls ~/.claude/rules/ecc/ 2>/dev/null | wc -l)
echo "  Global ECC rules:     ${global_rules}"

global_commands=$(ls ~/.claude/commands/ 2>/dev/null | wc -l)
echo "  Global ECC commands:  ${global_commands}"

echo ""
echo "=== Installation complete! ==="
echo ""
echo "Next steps:"
echo "  1. Open Claude Code in your project directory"
echo "  2. Tell Claude what you want to build"
echo "  3. Claude will auto-trigger the Brainstorming skill"
echo ""
