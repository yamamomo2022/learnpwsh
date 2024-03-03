
$Token = ""

# ChatGPT API の URI
$Uri = 'https://api.openai.com/v1/chat/completions'

# リクエストボディ
$PostBody = @{
  model = 'gpt-3.5-turbo'
  messages = @(
    @{
      role = 'user'
      content = 'テストって言って'
    }
  )
}


# ChatGPT に質問を投げかける
$Response = Invoke-WebRequest `
  -Method Post `
  -Uri $Uri `
  -ContentType 'application/json' `
  -Headers @{
    Authorization = "Bearer $Token"
  } `
  -Body ([System.Text.Encoding]::UTF8.GetBytes(($PostBody | ConvertTo-Json -Compress)))

# 回答を取得
$Answer = ($Response.Content | ConvertFrom-Json).choices[0].message.content

# 回答を表示
Write-Output $Answer

