# AI PowerShell Command Generator Demo
# This script demonstrates how to use the aicmd1 and aicmd2 functions

# First, import the functions
. "$PSScriptRoot\ai_powershell_commands.ps1"

# Check if API keys have been set
$content = Get-Content "$PSScriptRoot\ai_powershell_commands.ps1" -Raw
if ($content -contains "YOUR_OPENROUTER_API_KEY" -or $content -contains "YOUR_OPENAI_API_KEY") {
    Write-Host "`nWARNING: You need to replace the API keys in ai_powershell_commands.ps1 before running this demo.`n" -ForegroundColor Yellow
    Write-Host "Edit the file and replace:"
    Write-Host "  - YOUR_OPENROUTER_API_KEY with your actual OpenRouter API key"
    Write-Host "  - YOUR_OPENAI_API_KEY with your actual OpenAI API key`n"
    Write-Host "  - YOUR_ANTHROPIC_API_KEY with your actual Anthropic API key`n"
    exit
}

Write-Host "`n=== AI PowerShell Command Generator Demo ===`n" -ForegroundColor Yellow

# Demo for get-chat-cmd1 (OpenRouter - quasar-alpha)
Write-Host "Example 1: Using get-chat-cmd1 (OpenRouter - quasar-alpha)" -ForegroundColor Cyan
Write-Host "Request: 'List all running processes sorted by memory usage'" -ForegroundColor White
Write-Host "----------------"
aicmd1 "List all running processes sorted by memory usage"
Write-Host "----------------`n"

# Demo for get-chat-cmd2 (OpenAI - gpt-4o-mini)
Write-Host "Example 2: Using get-chat-cmd2 (OpenAI - gpt-4o-mini)" -ForegroundColor Green
Write-Host "Request: 'Find files modified in the last 24 hours'" -ForegroundColor White
Write-Host "----------------"
aicmd2 "Find files modified in the last 24 hours"
Write-Host "----------------`n"

# Demo for get-chat-cmd3 (Anthropic - claude-3-7-sonnet-20250219)
Write-Host "Example 4: Using get-chat-cmd3 (Anthropic - claude-3-7-sonnet)" -ForegroundColor Blue
Write-Host "Request: 'Create a scheduled task that runs every Monday at 9 AM'" -ForegroundColor White
Write-Host "----------------"
aicmd2 "Create a scheduled task that runs every Monday at 9 AM"
Write-Host "----------------`n"

# More examples
Write-Host "Example 4: Using get-chat-cmd1 (OpenRouter - quasar-alpha)" -ForegroundColor Cyan
Write-Host "Request: 'Check disk space usage for all drives'" -ForegroundColor White
Write-Host "----------------"
aicmd1 "Check disk space usage for all drives"
Write-Host "----------------`n"

Write-Host "Example 5: Using get-chat-local (LM Studio locally-hosted Anthropic - qwen2.5-coder-32b-instruct)" -ForegroundColor Magenta
Write-Host "Request: 'Create a scheduled task that runs every Monday at 9 AM'" -ForegroundColor White
Write-Host "----------------"
aicmd2 "Create a scheduled task that runs every Monday at 9 AM"
Write-Host "----------------`n"

Write-Host "Demo completed. Try your own requests with get-chat-cmd1-3 (or the optional get-chat-local)" -ForegroundColor Yellow
