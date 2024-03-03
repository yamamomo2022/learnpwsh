$Rhythm = 1000

[Console]::Beep(262, $Rhythm/4) #ド
[Console]::Beep(294, $Rhythm/4) #レ
[Console]::Beep(330, $Rhythm/4) #ミ
[Console]::Beep(349, $Rhythm/4) #ファ
[Console]::Beep(330, $Rhythm/4) #ミ
[Console]::Beep(294, $Rhythm/4) #レ
[Console]::Beep(262, $Rhythm/4) #ド

Start-Sleep -Milliseconds ($Rhythm/4)

[Console]::Beep(330, $Rhythm/4) #ミ
[Console]::Beep(349, $Rhythm/4) #ファ
[Console]::Beep(392, $Rhythm/4) #ソ
[Console]::Beep(440, $Rhythm/4) #ラ
[Console]::Beep(392, $Rhythm/4) #ソ
[Console]::Beep(349, $Rhythm/4) #ファ
[Console]::Beep(330, $Rhythm/4) #ミ
Start-Sleep -Milliseconds ($Rhythm/4)

[Console]::Beep(262, $Rhythm/4) #ド
Start-Sleep -Milliseconds ($Rhythm/4)
[Console]::Beep(262, $Rhythm/4) #ド
Start-Sleep -Milliseconds ($Rhythm/4)
[Console]::Beep(262, $Rhythm/4) #ド
Start-Sleep -Milliseconds ($Rhythm/4)
[Console]::Beep(262, $Rhythm/4) #ド

Start-Sleep -Milliseconds ($Rhythm/4)

[Console]::Beep(262, $Rhythm/8) #ド
[Console]::Beep(262, $Rhythm/8) #ド
[Console]::Beep(294, $Rhythm/8) #レ
[Console]::Beep(294, $Rhythm/8) #レ
[Console]::Beep(330, $Rhythm/8) #ミ
[Console]::Beep(330, $Rhythm/8) #ミ
[Console]::Beep(349, $Rhythm/8) #ファ
[Console]::Beep(349, $Rhythm/8) #ファ
[Console]::Beep(330, $Rhythm/4) #ミ
[Console]::Beep(294, $Rhythm/4) #レ
[Console]::Beep(262, $Rhythm/4) #ド
Start-Sleep -Milliseconds ($Rhythm/4)
