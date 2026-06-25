# Get-NetworkInfo.ps1
# Description: Collects network configuration details for Windows endpoint troubleshooting.

Write-Host "=== Network Information Report ===" -ForegroundColor Cyan
Write-Host ""

$Adapters = Get-NetAdapter | Where-Object { $_.Status -eq "Up" }

foreach ($Adapter in $Adapters) {
    Write-Host "Adapter Name: $($Adapter.Name)"
    Write-Host "Interface Description: $($Adapter.InterfaceDescription)"
    Write-Host "Status: $($Adapter.Status)"
    Write-Host "MAC Address: $($Adapter.MacAddress)"
    Write-Host ""

    $IPConfig = Get-NetIPConfiguration -InterfaceAlias $Adapter.Name

    Write-Host "IPv4 Address: $($IPConfig.IPv4Address.IPAddress)"
    Write-Host "IPv6 Address: $($IPConfig.IPv6Address.IPAddress)"
    Write-Host "Default Gateway: $($IPConfig.IPv4DefaultGateway.NextHop)"
    Write-Host "DNS Servers: $($IPConfig.DNSServer.ServerAddresses -join ', ')"
    Write-Host ""

    Write-Host "----------------------------------------"
    Write-Host ""
}
