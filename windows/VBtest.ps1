# Excelアプリケーションのインスタンスを作成
$excel = New-Object -ComObject Excel.Application

# Excelを表示状態に設定（デバッグ用）
$excel.Visible = $True

# 新しいワークブックを追加
$workbook = $excel.Workbooks.Add()

# 新しいVBAマクロを追加するためのモジュールを挿入
$module = $workbook.VBProject.VBComponents.Add(1)

# .vbファイルのパス
$vbFilePath = "C:\Users\viole\Desktop\VBtest.vb"

# .vbファイルからVBAコードを読み込む
$vbaCode = Get-Content $vbFilePath  -Raw

# VBAコードをモジュールに追加
$module.CodeModule.AddFromString($vbaCode)

# マクロを実行
$excel.Run("HelloWorld")

# リソースのクリーンアップ（オプション）
$excel.Quit()
[System.Runtime.InteropServices.Marshal]::ReleaseComObject($excel)
[System.GC]::Collect()
[System.GC]::WaitForPendingFinalizers()
