# install.ps1 — Quick setup script for Skill For Develop (Windows)
Write-Host "=== Skill For Develop - Installer ===" -ForegroundColor Cyan
Write-Host ""

# Step 1: Check project-level skills
Write-Host "[1/2] Checking project-level skills..." -ForegroundColor Yellow
if (Test-Path ".claude\skills") {
    Write-Host "  OK .claude\skills\ exists" -ForegroundColor Green
} else {
    Write-Host "  ERROR .claude\skills\ not found" -ForegroundColor Red
    exit 1
}

# Step 2: Verify
Write-Host ""
Write-Host "[2/2] Verifying installation..." -ForegroundColor Yellow
Write-Host ""

$skillsCount = (Get-ChildItem -Path ".claude\skills" -Recurse -Filter "SKILL.md" -Depth 2 -ErrorAction SilentlyContinue).Count
Write-Host "  Project-level skills: $skillsCount SKILL.md files"

$eccCount = (Get-ChildItem ".claude\skills\ecc" -ErrorAction SilentlyContinue).Count
Write-Host "  ECC sub-skills:       $eccCount"

Write-Host ""
Write-Host "=== Installation complete! ===" -ForegroundColor Green
Write-Host ""
Write-Host "Next steps:"
Write-Host "  1. Open Claude Code in your project directory"
Write-Host "  2. Tell Claude what you want to build"
Write-Host "  3. Claude will auto-trigger the Brainstorming skill"
Write-Host ""
