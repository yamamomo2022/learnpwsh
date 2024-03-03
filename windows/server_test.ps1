$url = "http://127.0.0.1:8080/"

$listener = New-Object system.net.HttpListener
$listener.Prefixes.Add($url)
try {
    $listener.Start()
    $url
    while ($true) {
        $context = $listener.GetContext()
        $request = $context.Request
        $response = $context.Response
        if($request.HttpMethod -eq "GET"){
            # GET時にはHello, world!を返す
            $text = "Hello, world!" 
        }elseif($request.HttpMethod -eq "POST"){
            # POST時には受け取った文字列をそのまま返す(エンコーディングは考慮しない)
            $reader = New-Object System.IO.StreamReader($request.InputStream)
            $text = $reader.ReadToEnd()
            $reader.Close()
        }else{
            # PUTなどには未対応。必要に応じて上記のelseifを参考によしなにすること
            $response.StatusCode = 400 # Bad request
            $response.Close()
            continue
        }
        $bytes = [System.Text.Encoding]::UTF8.GetBytes($text)
        $response.ContentLength64 = $bytes.Length
        $output = $response.OutputStream
        $output.Write($bytes, 0, $bytes.Length)
        $output.Close()
    }
} finally {
    $listener.Stop()
    $listener.Dispose()
}
