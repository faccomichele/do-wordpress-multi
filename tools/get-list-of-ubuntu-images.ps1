$headers = @{
    "Content-Type" = "application/json"
    "Authorization" = "Bearer $env:DIGITALOCEAN_ACCESS_TOKEN"
}

$results = (
    (
        Invoke-WebRequest -UseBasicParsing -Method "GET" -Headers $headers -Uri "https://api.digitalocean.com/v2/images?type=distribution").Content | ConvertFrom-Json
    ).images | Where-Object {$_.distribution -eq "Ubuntu"} | Select-Object -Property  slug, name, created_at

$results
