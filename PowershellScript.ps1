# Filesystem Check Script

Write-Host "===== FILESYSTEM CHECK ====="

Get-CimInstance Win32_LogicalDisk -Filter "DriveType=3" |
ForEach-Object {

    $Drive = $_.DeviceID
    $Total = [math]::Round($_.Size / 1GB, 2)
    $Free = [math]::Round($_.FreeSpace / 1GB, 2)
    $Used = [math]::Round($Total - $Free, 2)
    $FreePercent = [math]::Round(($_.FreeSpace / $_.Size) * 100, 2)

    Write-Host "Drive          : $Drive"
    Write-Host "Total Space    : $Total GB"
    Write-Host "Used Space     : $Used GB"
    Write-Host "Free Space     : $Free GB"
    Write-Host "Free Percentage: $FreePercent %"

    if ($FreePercent -lt 20) {
        Write-Host "Status         : WARNING - Low Disk Space" -ForegroundColor Red
    }
    else {
        Write-Host "Status         : HEALTHY" -ForegroundColor Green
    }

    Write-Host "-----------------------------"
}
