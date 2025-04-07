# AI PowerShell Command Generator - Installation Script
# This script helps install the AI PowerShell command generator functions to your profile

# Determine the right profile path
if (!(Test-Path -Path $PROFILE)) {
    Write-Host "Creating PowerShell profile at $PROFILE" -ForegroundColor Yellow
    New-Item -ItemType File -Path $PROFILE -Force | Out-Null
}

# Current directory where the script is located
$currentDir = $PSScriptRoot
if (!$currentDir) {
    $currentDir = (Get-Location).Path
}

$combinedFilePath = Join-Path $currentDir "ai_powershell_commands.ps1"

# Check if the file exists
if (!(Test-Path $combinedFilePath)) {
    Write-Host "Error: Could not find ai_powershell_commands.ps1 in the current directory." -ForegroundColor Red
    exit 1
}

# Check if API keys have been replaced
$content = Get-Content $combinedFilePath -Raw
if ($content -match "YOUR_OPENROUTER_API_KEY" -or $content -match "YOUR_OPENAI_API_KEY") {
    Write-Host "`nWARNING: You need to replace the API keys in ai_powershell_commands.ps1 before installing.`n" -ForegroundColor Yellow
    
    $replace = Read-Host "Would you like to add your API keys now? (y/n)"
    if ($replace -eq "y") {
        $openRouterKey = Read-Host "Enter your OpenRouter API key"
        $openAIKey = Read-Host "Enter your OpenAI API key"
        
        $content = $content -replace "YOUR_OPENROUTER_API_KEY", $openRouterKey
        $content = $content -replace "YOUR_OPENAI_API_KEY", $openAIKey
        
        Set-Content -Path $combinedFilePath -Value $content
        Write-Host "API keys updated successfully." -ForegroundColor Green
    }
    else {
        Write-Host "Please manually edit ai_powershell_commands.ps1 to add your API keys before installing." -ForegroundColor Yellow
        exit 1
    }
}

# Ask user for installation method
Write-Host "`nHow would you like to install the AI PowerShell Command Generator?" -ForegroundColor Cyan
Write-Host "1. Copy functions directly into PowerShell profile"
Write-Host "2. Add a reference to the functions file in PowerShell profile"
$choice = Read-Host "Enter choice (1 or 2)"

switch ($choice) {
    "1" {
        # Append to profile
        Add-Content -Path $PROFILE -Value "`n# AI PowerShell Command Generator Functions`n"
        Add-Content -Path $PROFILE -Value (Get-Content $combinedFilePath)
        Write-Host "`nFunctions have been added to your PowerShell profile at $PROFILE" -ForegroundColor Green
    }
    "2" {
        # Add reference to profile
        $referenceLine = "`n# AI PowerShell Command Generator Functions`n. `"$combinedFilePath`"`n"
        Add-Content -Path $PROFILE -Value $referenceLine
        Write-Host "`nReference to functions file has been added to your PowerShell profile at $PROFILE" -ForegroundColor Green
    }
    default {
        Write-Host "Invalid choice. Installation aborted." -ForegroundColor Red
        exit 1
    }
}

Write-Host "`nInstallation complete! Please restart PowerShell or reload your profile with:"
Write-Host ". $PROFILE" -ForegroundColor Cyan
Write-Host "`nYou can now use the commands:" -ForegroundColor Green
Write-Host "aicmd1 'your plain English request for PowerShell command'"
Write-Host "aicmd2 'your plain English request for PowerShell command'"
