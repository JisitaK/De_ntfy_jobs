$ErrorActionPreference = "Stop"

# 2-to-5 years variant of the GCC/product data job monitor.
# This wrapper keeps the main monitor logic intact and only narrows the experience target.
$env:ROLEPILOT_MIN_YEARS = if ($env:ROLEPILOT_MIN_YEARS) { [string]$env:ROLEPILOT_MIN_YEARS } else { "2" }
$env:ROLEPILOT_MAX_YEARS = if ($env:ROLEPILOT_MAX_YEARS) { [string]$env:ROLEPILOT_MAX_YEARS } else { "5" }
$env:ROLEPILOT_WRITE_APP_OUTPUTS = "false"

if (-not $env:ROLEPILOT_NTFY_TOPIC) {
  $env:ROLEPILOT_NTFY_TOPIC = "https://ntfy.sh/Jisita_Data_expert"
}

& (Join-Path $PSScriptRoot "run_gcc_product_monitor.ps1")
