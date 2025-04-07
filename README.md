# get-chat-cmd: AI PowerShell Command Generator

This repository contains PowerShell functions that convert plain English requests into PowerShell commands using your chosen AI LLM.  LLM outputs a PS command for review in console + copies the command to clipboard.

## Functions

- `get-chat-cmd1`: Uses OpenRouter's API with the "openrouter/quasar-alpha" model
- `get-chat-cmd2`: Uses OpenAI's API with the "gpt-4o-mini" model

## Setup

1. Edit `ai_powershell_commands.ps1` to replace:
   - `YOUR_OPENROUTER_API_KEY` with your actual OpenRouter API key
   - `YOUR_OPENAI_API_KEY` with your actual OpenAI API key

2. Import the functions into your current PowerShell session:

```powershell
. C:\Users\westj\Desktop\ai_powershell_commands.ps1
```

## Usage

Simply call either function with your plain English request:

```powershell
# Using OpenRouter (quasar-alpha)
get-chat-cmd1 "List all running processes sorted by memory usage"

# Using OpenAI (gpt-4o-mini)
get-chat-cmd2 "Find files modified in the last 24 hours"
```

The functions will:
1. Make an API call to the appropriate service
2. Display the resulting PowerShell command in colored text
3. Copy the command to your clipboard for easy use

## Adding to Your PowerShell Profile

To make these functions available in all your PowerShell sessions, add the contents of `ai_powershell_commands.ps1` to your PowerShell profile:

1. Open your PowerShell profile in a text editor:

```powershell
notepad $PROFILE
```

2. Copy and paste the contents of `ai_powershell_commands.ps1` into your profile
3. Save the file and restart PowerShell

Alternatively, you can add this line to your PowerShell profile to source the functions file:

```powershell
. "C:\Users\westj\Desktop\ai_powershell_commands.ps1"
