
# 無限ループでリソース使用量を監視
while ($true) {
    # CPU使用率の取得
    $cpuLoad = (Get-Counter -Counter "\Processor(_Total)\% Processor Time" -SampleInterval 1 -MaxSamples 1).CounterSamples.CookedValue

    # メモリ使用率の取得
    $totalMemory = (Get-CimInstance -ClassName Win32_ComputerSystem).TotalPhysicalMemory / 1GB
    $usedMemory = $totalMemory - ((Get-Counter -Counter "\Memory\Available MBytes" -SampleInterval 1 -MaxSamples 1).CounterSamples.CookedValue / 1024)
    $memoryLoad = ($usedMemory / $totalMemory) * 100

    # ディスク使用率の取得
    $diskRead = (Get-Counter -Counter "\PhysicalDisk(_Total)\Disk Read Bytes/sec" -SampleInterval 1 -MaxSamples 1).CounterSamples.CookedValue
    $diskWrite = (Get-Counter -Counter "\PhysicalDisk(_Total)\Disk Write Bytes/sec" -SampleInterval 1 -MaxSamples 1).CounterSamples.CookedValue

    # ネットワーク使用率の取得
    $networkReceived = (Get-Counter -Counter "\Network Interface(_Total)\Bytes Received/sec" -SampleInterval 1 -MaxSamples 1).CounterSamples.CookedValue
    $networkSent = (Get-Counter -Counter "\Network Interface(_Total)\Bytes Sent/sec" -SampleInterval 1 -MaxSamples 1).CounterSamples.CookedValue

    # 結果を表示
    Clear-Host
    Write-Host "CPU Load: $([Math]::Round($cpuLoad, 2))%"
    Write-Host "Memory Load: $([Math]::Round($memoryLoad, 2))% ($([Math]::Round($usedMemory, 2)) GB used out of $([Math]::Round($totalMemory, 2)) GB)"
    Write-Host "Disk Read: $([Math]::Round($diskRead / 1MB, 2)) MB/s, Disk Write: $([Math]::Round($diskWrite / 1MB, 2)) MB/s"
    Write-Host "Network Received: $([Math]::Round($networkReceived / 1MB, 2)) MB/s, Network Sent: $([Math]::Round($networkSent / 1MB, 2)) MB/s"
    
    # 5秒間の間隔を設ける
    Start-Sleep -Seconds 5
}
