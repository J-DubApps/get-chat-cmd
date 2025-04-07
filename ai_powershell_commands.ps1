function get-chat-cmd1 {
    param(
        [Parameter(Mandatory = $true)]
        [string]$Request
    )

    # Replace with your actual OpenRouter API key
    $apiKey = "YOUR_OPENROUTER_API_KEY"
    
    $headers = @{
        "Authorization" = "Bearer $apiKey"
        "Content-Type" = "application/json"
        "HTTP-Referer" = "https://localhost"  # Required by OpenRouter
        "X-Title" = "PowerShell Command Generator"  # Optional
    }
    
    $body = @{
        model = "openrouter/quasar-alpha"
        messages = @(
            @{
                role = "system"
                content = "You are a PowerShell command generator. Your task is to convert plain English requests into valid PowerShell commands. Respond ONLY with the PowerShell command without any explanations, comments, or markdown formatting. Do not include backticks or code blocks in your response. Just provide the raw PowerShell command that would accomplish the user's request."
            },
            @{
                role = "user"
                content = $Request
            }
        )
    }
    
    try {
        $response = Invoke-RestMethod -Uri "https://openrouter.ai/api/v1/chat/completions" -Method Post -Headers $headers -Body ($body | ConvertTo-Json -Depth 10)
        $command = $response.choices[0].message.content
        
        # Output the command to the console without executing it
        Write-Host "`n$command`n" -ForegroundColor Cyan
        
        # Optionally, copy to clipboard for easy use
        $command | Set-Clipboard
        Write-Host "Command copied to clipboard." -ForegroundColor Gray
    }
    catch {
        Write-Host "Error: $_" -ForegroundColor Red
    }
}

function get-chat-cmd1 {
    param(
        [Parameter(Mandatory = $true)]
        [string]$Request
    )

    # Replace with your actual OpenAI API key
    $apiKey = "YOUR_OPENAI_API_KEY"
    
    $headers = @{
        "Authorization" = "Bearer $apiKey"
        "Content-Type" = "application/json"
    }
    
    $body = @{
        model = "gpt-4o-mini"
        messages = @(
            @{
                role = "system"
                content = "You are a PowerShell command generator. Your task is to convert plain English requests into valid PowerShell commands. Respond ONLY with the PowerShell command without any explanations, comments, or markdown formatting. Do not include backticks or code blocks in your response. Just provide the raw PowerShell command that would accomplish the user's request."
            },
            @{
                role = "user"
                content = $Request
            }
        )
        temperature = 0.7
        max_tokens = 500
    }
    
    try {
        $response = Invoke-RestMethod -Uri "https://api.openai.com/v1/chat/completions" -Method Post -Headers $headers -Body ($body | ConvertTo-Json -Depth 10)
        $command = $response.choices[0].message.content
        
        # Output the command to the console without executing it
        Write-Host "`n$command`n" -ForegroundColor Green
        
        # Optionally, copy to clipboard for easy use
        $command | Set-Clipboard
        Write-Host "Command copied to clipboard." -ForegroundColor Gray
    }
    catch {
        Write-Host "Error: $_" -ForegroundColor Red
    }
}

#region LICENSE
<#
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
#>
#endregion LICENSE

#region DISCLAIMER
<#
      DISCLAIMER:
      - Use at your own risk, etc.
      - This is open-source software, if you find an issue try to fix it yourself. There is no support and/or warranty in any kind
      - This is a third-party Software
      - The developer of this Software is NOT sponsored by or affiliated with Microsoft Corp (MSFT) or any of its subsidiaries in any way
      - The Software is not supported by me or Microsoft Corp (MSFT)
      - By using the Software, you agree to the License, Terms, and any Conditions declared and described above
      - If you disagree with any of the Terms, and any Conditions declared: Just delete it and build your own solution
#>
#endregion DISCLAIMER
