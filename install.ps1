# install.ps1 — Quick setup script for Skill For Develop (Windows)
Write-Host "=== Skill For Develop - Installer ===" -ForegroundColor Cyan
Write-Host ""

# Step 1: Check project-level skills
Write-Host "[1/3] Checking project-level skills..." -ForegroundColor Yellow
if (Test-Path ".claude\skills") {
    Write-Host "  OK .claude\skills\ exists" -ForegroundColor Green
} else {
    Write-Host "  ERROR .claude\skills\ not found" -ForegroundColor Red
    exit 1
}

# Step 2: Install ECC globally
Write-Host ""
Write-Host "[2/3] Installing Everything Claude Code (global)..." -ForegroundColor Yellow
if (Test-Path "everything-claude-code") {
    Set-Location "everything-claude-code"
    if (-not (Test-Path "node_modules")) {
        Write-Host "  Installing npm dependencies..."
        npm install --no-audit --no-fund --loglevel=error
    }
    Write-Host "  Running ECC installer..."
    bash install.sh --profile developer --target claude
    Set-Location ..
    Write-Host "  OK ECC installed to ~/.claude/" -ForegroundColor Green
} else {
    Write-Host "  SKIP everything-claude-code/ not found" -ForegroundColor Yellow
}

# Step 3: Verify
Write-Host ""
Write-Host "[3/3] Verifying installation..." -ForegroundColor Yellow
Write-Host ""

$skillsCount = (Get-ChildItem -Path ".claude\skills" -Recurse -Filter "SKILL.md" -Depth 2 -ErrorAction SilentlyContinue).Count
Write-Host "  Project-level skills: $skillsCount SKILL.md files"

$globalSkills = (Get-ChildItem "$env:USERPROFILE\.claude\skills\ecc" -ErrorAction SilentlyContinue).Count
Write-Host "  Global ECC skills:    $globalSkills"

$globalRules = (Get-ChildItem "$env:USERPROFILE\.claude\rules\ecc" -ErrorAction SilentlyContinue).Count
Write-Host "  Global ECC rules:     $globalRules"

$globalCommands = (Get-ChildItem "$env:USERPROFILE\.claude\commands" -ErrorAction SilentlyContinue).Count
Write-Host "  Global ECC commands:  $globalCommands"

Write-Host ""
Write-Host "=== Installation complete! ===" -ForegroundColor Green
Write-Host ""
Write-Host "Next steps:"
Write-Host "  1. Open Claude Code in your project directory"
Write-Host "  2. Tell Claude what you want to build"
Write-Host "  3. Claude will auto-trigger the Brainstorming skill"
Write-Host ""
