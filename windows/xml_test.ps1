# XMLデータを変数に代入
$xml = [xml]@"
<?xml version="1.0" encoding="utf-8"?>
<books>
  <book id="1">
    <title>PowerShell入門</title>
    <author>山田太郎</author>
    <price>3000</price>
  </book>
  <book id="2">
    <title>XMLの基礎</title>
    <author>佐藤花子</author>
    <price>2500</price>
  </book>
</books>
"@

# books要素の下のbook要素をループで処理
foreach ($book in $xml.books.book) {
  # title要素とprice要素の値を取得
  $title = $book.title
  $price = $book.price

  # タイトルと価格を表示
  Write-Host "$title : $price"
}
