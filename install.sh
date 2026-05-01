#!/usr/bin/env bash
# install.sh — Quick setup script for Skill For Develop
set -euo pipefail

echo "=== Skill For Develop — Installer ==="
echo ""

# Step 1: Check project-level skills
echo "[1/2] Checking project-level skills..."
if [ -d ".claude/skills" ]; then
    echo "  ✓ .claude/skills/ already exists"
else
    echo "  ✗ .claude/skills/ not found — are you in the repo root?"
    exit 1
fi

# Step 2: Verify
echo ""
echo "[2/2] Verifying installation..."
echo ""

skills_count=$(find .claude/skills -maxdepth 2 -name "SKILL.md" 2>/dev/null | wc -l)
echo "  Project-level skills: ${skills_count} SKILL.md files"

ecc_count=$(ls .claude/skills/ecc/ 2>/dev/null | wc -l)
echo "  ECC sub-skills:       ${ecc_count}"

echo ""
echo "=== Installation complete! ==="
echo ""
echo "Next steps:"
echo "  1. Open Claude Code in your project directory"
echo "  2. Tell Claude what you want to build"
echo "  3. Claude will auto-trigger the Brainstorming skill"
echo ""
