<#
.SYNOPSIS
  Deploys a Sigma detection rule (YAML) to a SIEM via REST API.

.PARAMETER RuleFile
  Path to the Sigma rule file in YAML format.

.PARAMETER Output
  Optional: Path to save the SIEM’s response JSON.
#>

param(
  [Parameter(Mandatory)]
  [string]$RuleFile,

  [string]$Output = ''
)

# === Configuration ===
$ApiUrl = 'https://siem.example.com/api/v1/rules'
$ApiKey = 'YOUR_SIEM_API_KEY_HERE'

# Validate rule file
if (-not (Test-Path $RuleFile)) {
  Write-Error "Rule file not found: $RuleFile"
  exit 1
}

# Read rule YAML
$ruleContent = Get-Content $RuleFile -Raw

Write-Host "📤 Deploying detection rule: $RuleFile" -ForegroundColor Cyan

try {
  $response = Invoke-RestMethod -Method Post -Uri $ApiUrl `
    -Headers @{ 'Authorization' = "Bearer $ApiKey"; 'Content-Type' = 'application/yaml' } `
    -Body $ruleContent -ErrorAction Stop

  Write-Host "✅ Rule deployed successfully. Rule ID: $($response.id)" -ForegroundColor Green

  if ($Output) {
    $response | ConvertTo-Json -Depth 5 | Out-File -FilePath $Output -Encoding UTF8
    Write-Host "✅ Response saved to $Output" -ForegroundColor Green
  }
}
catch {
  Write-Error "Failed to deploy rule: $_"
  exit 1
}
