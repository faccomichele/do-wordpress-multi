$headers = @{
    "Content-Type" = "application/json"
    "Authorization" = "Bearer $env:DIGITALOCEAN_ACCESS_TOKEN"
}

$results = (
    (
        Invoke-WebRequest -UseBasicParsing -Method "GET" -Headers $headers -Uri "https://api.digitalocean.com/v2/account/keys").Content | ConvertFrom-Json
    ).ssh_keys | Select-Object -Property  fingerprint, name

$results