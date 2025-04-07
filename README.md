# get-chat-cmd: AI PowerShell Command Generator

<img 
  src="https://raw.githubusercontent.com/J-DubApps/get-chat-cmd/main/get-chat-cmd.gif" 
  alt="Animated GIF" 
  width="600" 
  height="400">

This repo contains my PowerShell functions that I use for stating plain English requests to your chosen AI-LLM, and receiving back a PS command.  LLM outputs a PS command for review in console + copies the command to clipboard. **NOTE**: You **must** have *your own* API key from *at least one* of the 3 included AI Service Providers in order to minimally use *any one* of the 3 functions in `ai_powershell_commands.ps1`.  It is not expensive to maintain 3 API keys for these providers (and Openrouter is a gateway to multiple popular AI models).  

These functions have only been tested in **PowerShell Core 7.5** (they may work in 5.1, just haven't tested).  
Also you can rename the functions to anything you want (I think "`get-ai-cmd`" is better, but I'm too lazy to rename everything 😂).

## Functions

- `get-chat-cmd1`: Uses OpenRouter's API with the "openrouter/quasar-alpha" model
- `get-chat-cmd2`: Uses OpenAI's API with the "gpt-4o-mini" model
- `get-chat-cmd3`: Uses Anthropic's API with the "claude-3-7-sonnet-20250219" model

## Setup

1. Edit `ai_powershell_commands.ps1` to replace:  <br />
— `YOUR_OPENROUTER_API_KEY` with your actual OpenRouter API key  <br />
— `YOUR_OPENAI_API_KEY` with your actual OpenAI API key  <br />
— `YOUR_ANTHROPIC_API_API_KEY` with your actual Anthropoic API key

   **Note**:   If you primarily only use, say,  Openrouter.ai as your API gateway: the OpenAI and Anthropic
               models can be called through "openrouter/model-name" as well.  You'd simply comment-out the
               "`get-chat-cmd2/3`" functions accordingly, and copy/use "`get-chat-cmd1`" for other Openrouter models.
               See [this link](https://openrouter.ai/models) for Openrouter models available.  

3. Import the functions into your current PowerShell session:

```powershell
. C:\Users\username\Desktop\ai_powershell_commands.ps1
```

## Usage

Simply call either function with your plain English request:

```powershell
# Using OpenRouter (quasar-alpha)
get-chat-cmd1 "List all running processes sorted by memory usage"

# Using OpenAI (gpt-4o-mini)
get-chat-cmd2 "Find files modified in the last 24 hours"

# Using Anthropic (claude-3-7-sonnet-20250219)
get-chat-cmd3 "List all running processes"
```

These functions will:
1. Make an API call to the appropriate service
2. Display the resulting PowerShell command in colored text (without executing any code)
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
. "C:\Users\username\Desktop\ai_powershell_commands.ps1"
```

## Disclaimer

The functions provided in this repository are intended to assist in generating PowerShell commands through AI models. **Users are responsible for reviewing and understanding the commands generated *before* execution**. **The author assumes no liability for unintended consequences resulting from the use or misuse of these functions, including but not limited to inaccurate prompts leading to undesired command outputs**. **Additionally, the author is not responsible for any API usage charges incurred while using these functions**. **Users should monitor their API usage to avoid unexpected costs**.  

## License

This project is licensed under the MIT License: 

MIT License

Copyright (c) 2025 Julian West

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the “Software”), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED “AS IS”, WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.  

For more details, refer to the [MIT License](https://opensource.org/licenses/MIT). [oai_citation_attribution:0‡Wikipedia](https://en.wikipedia.org/wiki/MIT_License?utm_source=chatgpt.com)
