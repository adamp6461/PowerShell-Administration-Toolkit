# Get-SystemInfo.ps1
# Description: Collects basic system information for Windows endpoint auditing and troubleshooting.

Write-Host "=== System Information Report ===" -ForegroundColor Cyan
Write-Host ""

$ComputerSystem = Get-CimInstance Win32_ComputerSystem
$OperatingSystem = Get-CimInstance Win32_OperatingSystem
$Processor = Get-CimInstance Win32_Processor
$BIOS = Get-CimInstance Win32_BIOS

Write-Host "Computer Name: $env:COMPUTERNAME"
Write-Host "Manufacturer: $($ComputerSystem.Manufacturer)"
Write-Host "Model: $($ComputerSystem.Model)"
Write-Host "Serial Number: $($BIOS.SerialNumber)"
Write-Host "Operating System: $($OperatingSystem.Caption)"
Write-Host "OS Version: $($OperatingSystem.Version)"
Write-Host "Processor: $($Processor.Name)"
Write-Host "Total RAM (GB): $([math]::Round($ComputerSystem.TotalPhysicalMemory / 1GB, 2))"
Write-Host "Last Boot Time: $($OperatingSystem.LastBootUpTime)"
