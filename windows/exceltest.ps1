# Excel アプリケーションを開始
$excel = New-Object -ComObject Excel.Application
$excel.Visible = $false

# 新しい Workbook を作成
$workbook = $excel.Workbooks.Add()

# VBA コードの定義
$vbaCode = @"
    Sub SayHello()
        MsgBox "Hello from VBA!"
    End Sub
"@

# VBA マクロを追加するための新しいモジュールを作成
$module = $workbook.VBProject.VBComponents.Add(1)
$module.CodeModule.AddFromString($vbaCode)

# VBA マクロを実行
$excel.Run("SayHello")

# クリーンアップ

# ワークブックを保存せずに閉じる
$workbook.Close($false)

# Excel アプリケーションを終了
$excel.Quit()

# COMオブジェクトを解放してメモリリークを防ぐ
[System.Runtime.Interopservices.Marshal]::ReleaseComObject($workbook) | Out-Null
[System.Runtime.Interopservices.Marshal]::ReleaseComObject($excel) | Out-Null
[System.GC]::Collect()
[System.GC]::WaitForPendingFinalizers()