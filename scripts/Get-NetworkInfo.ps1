# Get-NetworkInfo.ps1
# Description: Collects redacted network configuration details for Windows endpoint troubleshooting.

Write-Host "=== Network Information Report ===" -ForegroundColor Cyan
Write-Host ""
Write-Host "Sensitive values are redacted for safe documentation and public portfolio use." -ForegroundColor Yellow
Write-Host ""

$Adapters = Get-NetAdapter | Where-Object { $_.Status -eq "Up" }

foreach ($Adapter in $Adapters) {
    Write-Host "Adapter Name: $($Adapter.Name)"
    Write-Host "Interface Description: $($Adapter.InterfaceDescription)"
    Write-Host "Status: $($Adapter.Status)"
    Write-Host "MAC Address: [REDACTED]"
    Write-Host ""

    $IPConfig = Get-NetIPConfiguration -InterfaceAlias $Adapter.Name

    Write-Host "IPv4 Address: [REDACTED]"
    Write-Host "IPv6 Address: [REDACTED]"
    Write-Host "Default Gateway: [REDACTED]"
    Write-Host "DNS Servers: [REDACTED]"
    Write-Host ""

    Write-Host "----------------------------------------"
    Write-Host ""
}
