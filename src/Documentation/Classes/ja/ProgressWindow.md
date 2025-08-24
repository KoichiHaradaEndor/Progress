<!-- ProgressWindowクラスは 4D Progress コンポーネントのラッパーメソッドで構成されていて、進捗ダイアログを内包するウィンドウの外観を制御するために使用します。 -->
# Progressコンポーネント - ProgressWindow クラス

## 説明

このクラスは 4D Progress コンポーネントのラッパーメソッドで構成されています。このクラスを使用することで、進捗ウィンドウの外観を制御したり、エラー処理メソッドをインストールしたりすることができます。

本クラスは共有シングルトンクラスです。

## コンストラクタ

### cs.Progress.ProgressWindow.me

## 関数・プロパティ

### .errorEventListener : Text

`errorEventListener` プロパティを使用して、4D Progressコンポーネント実行時に発生するかもしれないエラーイベントのリスナーメソッドを設定・取得できます。

イベントリスナーメソッドに関する詳細は4Dの `Progress SET ON ERROR METHOD` 関数のマニュアルを参照してください。

#### サンプルコード

```4d
var $method_t : Text
var $progressWindow_o : cs.Progress.ProgressWindow
$progressWindow_o:=cs.Progress.ProgressWindow.me
$progressWindow_o.errorEventListener:="funcOnError"
$method_t:=$progressWindow_o.errorEventListener // "funcOnError"
```

### .hide()

この関数を使用して進捗ウィンドウを非表示状態にできます。
<a id="hide-sample-code"></a>
#### サンプルコード

```4d
var $progressWindow_o : cs.Progress.ProgressWindow
$progressWindow_o:=cs.Progress.ProgressWindow.me
$progressWindow_o.hide()
$progressWindow_o.show()
```

### .move(hPos : Integer; vPos : Integer)

この関数は進捗ウィンドウを指定された位置に移動します。`hPos` と `vPos` にウィンドウ左上の座標を渡します。

#### サンプルコード

```4d
var $progressWindow_o : cs.Progress.ProgressWindow
$progressWindow_o:=cs.Progress.ProgressWindow.me
$progressWindow_o.setCoordinates(10;30)
```

### .fonts(setting : Object)

この関数を使用して、進捗ダイアログのタイトル、メッセージ、およびボタンに適用されるフォント名やフォントサイズを変更します。設定はすべてのダイアログに適用されます。

オブジェクトは以下の構造を持ちます：

|第一レベル|第二レベル|型|
|:--------|:--------|:--------:|
|title|fontSize|Integer|
||fontName|Text|
|message|fontSize|Integer|
||fontName|Text|
|button|fontSize|Integer|
||fontName|Text|

フォント名やフォントサイズを変更しない場合、対応するプロパティを省略できます。第一レベルを省略した場合はフォント名とフォントサイズ両方を変更しないことを示します。

#### サンプルコード

```4d
var $setting_o : Object
var $progressWindow_o : cs.Progress.ProgressWindow
$setting_o:={}
$setting_o.title:={fontSize: 13; fontName: "Arial"}
$setting_o.message:={fontSize: 10; fontName: "Helvetica"}
$setting_o.button:={fontSize: 12; fontName: "Arial"}
$progressWindow_o:=cs.Progress.ProgressWindow.me
$progressWindow_o.setGlobalAppearance($setting_o)
```

### .show()

この関数を使用して、 `.hide()` 関数により非表示状態にされた進捗ウィンドウを表示状態にできます。

#### サンプルコード

`.hide()`の[サンプルコード](#hide-sample-code)を参照
