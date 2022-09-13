$headers = @{
    "Content-Type" = "application/json"
    "Authorization" = "Bearer $env:DIGITALOCEAN_ACCESS_TOKEN"
}

$results = (
    (
        Invoke-WebRequest -UseBasicParsing -Method "GET" -Headers $headers -Uri "https://api.digitalocean.com/v2/sizes").Content | ConvertFrom-Json
    ).sizes | Where-Object {$_.available -eq $True} | Select-Object -Property  slug, memory, vcpus, price_monthly

$results