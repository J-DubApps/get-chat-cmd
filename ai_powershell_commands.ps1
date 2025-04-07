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
