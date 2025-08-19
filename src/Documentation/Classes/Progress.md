<!-- Progressクラスは 4D Progress コンポーネントのラッパーメソッドで構成されています。 -->
# Progressコンポーネント - Progress クラス

## 説名

このクラスは 4D Progress コンポーネントのラッパーメソッドで構成されています。このクラスを使用することで、各進捗ダイアログに名前でアクセスすることができるようになります。結果 progress id を気にすることなく、サブルーチンや他のプロセスからも進捗ダイアログにアクセスすることができます。

ほとんどのプロパティや関数は操作対象の進捗ダイアログに適用されますが、「グローバル設定」と記載のあるプロパティや関数は進捗ウィンドウ全体に適用されます。

## コンストラクタ

### cs.Progress.Progress.new(name : Text{; option : Object})

進捗ダイアログの名前を `name` に渡します。同じ名前を使用してインスタンス化された進捗ダイアログオブジェクトは、サブルーチンや他のプロセスにおいても同じ進捗ダイアログを参照します。

`option` を使用して進捗ダイアログの表示に関わる設定を行うことができます。以下のプロパティを設定可能です：

|プロパティ名|型|説名|
|:---------|:--|:--|
|buttonEnabled|Boolean|停止ボタンの表示設定。デフォルトは非表示。|
|buttonTitle|Text|停止ボタンのタイトル (Windows OSのみ有効)|
|progress|Real|進捗バーの値 (-1 または 0~1)|
|title|Text|進捗ダイアログのメインタイトル|
|message|Text|進捗ダイアログの詳細メッセージ|
|icon|Picture|進捗ダイアログに表示するアイコン|
|stopEventListener|Text|停止ボタンがクリックされた際に実行されるコールバックメソッド名|
|errorEventListener|Text|4DのProgressコンポーネントメソッド実行時にエラーが発生した場合に呼ばれるコールバックメソッド名。|

<a id="constructor-sample-code"></a>
#### サンプルコード
```4d
var $i; $max_l : Integer
var $value_o : Object
var $progress_o : cs.Progress.Progress

$progress_o:=cs.Progress.Progress.new("LoopThroughSelection")
$progress_o.buttonEnabled:=True
$progress_o.title:="Preparing..."
$progress_o.progress:=-1
$progress_o.start()

$max_l:=100
$value_o:={}
For ($i; 1; $max_l)
  $value_o.progress:=$i/$max_l
  $value_o.title:="Calculating"
  $value_o.message:=String($i)+" / "+String($max_l)
  $progress_o.setProgress($value_o)
  If ($progress_o.stopped)
    break
  End if 
End for 
$progress_o.stop()
```

```4d
var $progress_o : cs.Progress.Progress
var $option_o : Object
$option_o:={buttonEnabled: True; title: "Preparing"; progress: -1}
$progress_o:=cs.Progress.Progress.new("LoopThroughSelection"; $option_o)
```

## 関数・プロパティ

### .buttonEnabled : Boolean

`buttonEnabled` プロパティを使用して停止ボタンの表示・非表示を設定します。デフォルトで停止ボタンは表示されません。ボタンを表示するには `True` を設定します。

#### サンプルコード

```4d
var $enabled_b : Boolean
var $progress_o : cs.Progress.Progress
$progress_o:=cs.Progress.Progress.new("LoopThroughSelection")
$progress_o.buttonEnabled:=True
$enabled_b:=$progress_o.buttonEnabled  // True
```

### .buttonTitle : Text

(このプロパティは Windows でのみ有効です)

`buttonTitle` プロパティを使用して停止ボタンのタイトル文字列を設定・取得できます。

#### サンプルコード

```4d
var $buttonTitle_t : Text
var $progress_o : cs.Progress.Progress
$progress_o:=cs.Progress.Progress.new("LoopThroughSelection")
$progress_o.buttonTitle:="停止"
$buttonTitle_t:=$progress_o.buttonTitle  // 停止
```

### .stopped : Boolean

`canceled` プロパティはユーザーにより停止ボタンがクリックされたかどうかを示すブール値を返します。クリックされた場合は True を、そうでなければ False を返します。この属性は読み出しのみです。

#### サンプルコード

コンストラクターの[サンプルコード](#constructor-sample-code)を参照

### .errorEventListener : Text

**本プロパティはグローバル設定です。**

`errorEventListener` プロパティを使用して、クラス関数の実行時やプロパティ参照した際に発生するかもしれないエラーイベントのリスナーメソッドを設定・取得できます。

イベントリスナーメソッドに関する詳細は4Dの `Progress SET ON ERROR METHOD` 関数のマニュアルを参照してください。

#### サンプルコード

```4d
var $method_t : Text
var $progress_o : cs.Progress.Progress
$progress_o:=cs.Progress.Progress.new("LoopThroughSelection")
$progress_o.errorEventListener:="funcOnError"
$method_t:=$progress_o.errorEventListener // "funcOnError"
```

### .hide()

**本関数はグローバル設定です。**

この関数を使用して進捗ウィンドウを非表示状態にできます。
<a id="hide-sample-code"></a>
#### サンプルコード

```4d
var $progress_o : cs.Progress.Progress
$progress_o:=cs.Progress.Progress.new()
$progress_o.start()
$progress_o.hide()
$progress_o.show()
```

### .icon : Picture

`icon` プロパティを使用して進捗ダイアログに表示されるアイコン画像を設定・取得できます。

画像サイズは以下の通りです

- Windows : 80 x 40 px
- macOS : 40 x 40 px

これを超えるサイズの画像は縮小されます。

#### サンプルコード

```4d
var $icon_g : Picture
var $progress_o : cs.Progress.Progress
$progress_o:=cs.Progress.Progress.new("LoopThroughSelection")
$progress_o.icon:=$icon_g
$icon_g:=$progress_o.icon
```

### .message : Text

`message` プロパティを使用して、進捗ダイアログ画面上、タイトルの下 (Windows) や進捗バーの下 (macOS) に表示されるメッセージテキストを設定・取得します。

#### サンプルコード

```4d
var $i : Integer
var $selection_o : 4D.EntitySelection
var $progress_o : cs.Progress.Progress
$progress_o:=cs.Progress.Progress.new("LoopThroughSelection")
$progress_o.start()
For($i; 0; $selection_o.length-1)
    $progress_o.message:="Processing "+String($i+1)+" / "+String($selection_o.length)+" entities."
    $message_t:=$progress_o.message
End for
```

### .setCoordinates(hPos : Integer; vPos : Integer)

**本関数はグローバル設定です。**

この関数は進捗ウィンドウを指定された位置に移動します。`hPos` と `vPos` にウィンドウ左上の座標を渡します。

#### サンプルコード

```4d
var $progress_o : cs.Progress.Progress
$progress_o:=cs.Progress.Progress.new()
$progress_o.setCoordinates(10;30)
```

### .setGlobalAppearance(appearance : Object)

**本関数はグローバル設定です。**

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
var $appearance_o : Object
var $progress_o : cs.Progress.Progress
$progress_o:=cs.Progress.Progress.new()
$appearance_o:={}
$appearance_o.title:={fontSize: 13; fontName: "Arial"}
$appearance_o.message:={fontSize: 10; fontName: "Helvetica"}
$appearance_o.button:={fontSize: 12; fontName: "Arial"}
$progress_o.setGlobalAppearance($appearance_o)
```

### .show()

**本プロパティはグローバル設定です。**

この関数を使用して、 `.hide()` 関数により非表示状態にされた進捗ウィンドウを表示状態にできます。

#### サンプルコード

`.hide()`の[サンプルコード](#hide-sample-code)を参照

### .stopEventListener : Text

`stopEventListener` プロパティを使用して、ユーザーが停止ボタンをクリックした際に発行される Stop イベントのリスナーメソッドを設定・取得できます。

イベントリスナーメソッドに関する詳細は4Dの `Progress SET ON STOP METHOD` 関数のマニュアルを参照してください。

#### サンプルコード

```4d
var $method_t : Text
var $progress_o : cs.Progress.Progress
$progress_o:=cs.Progress.Progress.new("LoopThroughSelection")
$progress_o.start()
$progress_o.stopEventListener:="funcOnStop"
$method_t:=$progress_o.stopEventListener  // "funcOnStop"
```

### .progress : Real

`progress` プロパティを使用して進捗バーの現在値にアクセスします。値の範囲は 0 から 1 までで、-1 を渡すと進行状況不定の進捗バーが表示されます。

#### サンプルコード

```4d
var $i : Integer
var $progress_r : Real
var $selection_o : 4D.EntitySelection
var $progress_o : cs.Progress.Progress
$progress_o:=cs.Progress.Progress.new("LoopThroughSelection")
$progress_o.start()
For($i; 0; $selection_o.length-1)
    $progress_o.progress:=($i+1)/$selection_o.length
    $progress_r:=$progress_o.progress
End for
```

### .setProgress(value : object)

この関数を使用して進捗バーの値やタイトル、およびメッセージを一括して設定できます。

オブジェクト型の `value` 引数には以下のプロパティを設定します：

- progress: 進捗バーの値で、値の範囲は-1または0から1です。
- title: 進捗ダイアログのタイトルです。
- message: 進捗ダイアログのメッセージテキストです。

各プロパティは省略可能です。

#### サンプルコード

コンストラクターの[サンプルコード](#constructor-sample-code)を参照

### .start()

この関数は進捗ウィンドウに新しい進捗ダイアログを追加します。同じ名前を持つダイアログがすでに存在する場合はなにも行いません。

#### サンプルコード

```4d
var $progress_o : cs.Progress.Progress
$progress_o:=cs.Progress.Progress.new("LoopThroughSelection")
$progress_o.start()
```

### .stop()

この関数は対応する進捗ダイアログを進捗ウィンドウから取り除きます。

#### サンプルコード

```4d
var $progress_o : cs.Progress.Progress
$progress_o:=cs.Progress.Progress.new("LoopThroughSelection")
$progress_o.start()
// 作業を行う
$progress_o.stop()
```

### .title : Text

`title` プロパティを使用して、進捗ダイアログ画面上部に表示されるタイトルテキストを設定・取得します。

#### サンプルコード

```4d
var $title_t : Text
var $progress_o : cs.Progress.Progress
$progress_o:=cs.Progress.Progress.new("LoopThroughSelection")
$progress_o.start()
For($i; 0; $selection_o.length-1)
    $progress_o.title:="In progress"
    $title_t:=$progress_o.title
End for
```
