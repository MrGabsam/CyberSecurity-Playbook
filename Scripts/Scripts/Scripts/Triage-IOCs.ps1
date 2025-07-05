<#
.SYNOPSIS
  Queries a SIEM API for Indicators of Compromise (IOCs) and exports results.

.PARAMETER IocFile
  Path to a text file with one IOC (IP, hash, or domain) per line.

.PARAMETER OutputCsv
  Path to the CSV file to write results to.
#>

param(
  [Parameter(Mandatory)]
  [string]$IocFile,

  [Parameter(Mandatory)]
  [string]$OutputCsv
)

# === Configuration ===
$ApiUrl = 'https://siem.example.com/api/v1/search'
$ApiKey = 'YOUR_SIEM_API_KEY_HERE'

# Validate input file
if (-not (Test-Path $IocFile)) {
  Write-Error "IOC file not found: $IocFile"
  exit 1
}

# Prepare output
$results = @()

# Read each IOC and query the SIEM
Get-Content $IocFile | ForEach-Object {
  $ioc = $_.Trim()
  if ($ioc -eq '') { return }

  Write-Host "🔍 Searching for IOC: $ioc" -ForegroundColor Cyan

  # Build request body
  $body = @{
    query = $ioc
    timeframe = '24h'
    max_results = 100
  } | ConvertTo-Json

  try {
    $response = Invoke-RestMethod -Method Post -Uri $ApiUrl `
      -Headers @{ 'Authorization' = "Bearer $ApiKey"; 'Content-Type' = 'application/json' } `
      -Body $body -ErrorAction Stop

    # Process response.results array
    foreach ($hit in $response.results) {
      $results += [PSCustomObject]@{
        IOC           = $ioc
        Timestamp     = $hit.timestamp
        Host          = $hit.host_name
        EventID       = $hit.event_id
        Description   = $hit.description
        Severity      = $hit.severity
        RawData       = ($hit.raw_data -replace "`n"," ").Trim()
      }
    }
  }
  catch {
    Write-Warning "Failed to query IOC '$ioc': $_"
    $results += [PSCustomObject]@{
      IOC           = $ioc
      Timestamp     = ''
      Host          = ''
      EventID       = ''
      Description   = 'Query failed'
      Severity      = ''
      RawData       = ''
    }
  }
}

# Export to CSV
$results | Export-Csv -Path $OutputCsv -NoTypeInformation -Encoding UTF8
Write-Host "✅ IOC triage complete. Results saved to $OutputCsv" -ForegroundColor Green
