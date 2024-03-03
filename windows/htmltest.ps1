# WebページからHTMLを取得する
$response = Invoke-WebRequest -Uri 'http://example.com'

# HTMLコンテンツを表示する
$response.Content

# 特定のHTML要素を取得する、例えば 'div' タグ
$divs = $response.ParsedHtml.getElementsByTagName('div')
foreach ($div in $divs) {
    $div.innerHTML
}

# 特定のIDを持つ要素を取得する
$element = $response.ParsedHtml.getElementById('特定のID')
$element.outerHTML

# XPathを使用して特定の要素を取得する
$xpath = '//*[@id="特定のID"]'
$element = $response.ParsedHtml.selectSingleNode($xpath)
$element.outerHTML
