$headers = @{
    "Content-Type" = "application/json"
    "Authorization" = "Bearer $env:DIGITALOCEAN_ACCESS_TOKEN"
}

$results = (
    (
        Invoke-WebRequest -UseBasicParsing -Method "GET" -Headers $headers -Uri "https://api.digitalocean.com/v2/regions").Content | ConvertFrom-Json
    ).regions | Where-Object {$_.available -eq $True} | Select-Object -Property  slug, name

$results