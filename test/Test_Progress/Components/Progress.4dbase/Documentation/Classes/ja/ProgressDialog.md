<!-- ProgressDialogクラスは 4D Progress コンポーネントのラッパーメソッドで構成されていて、進捗ダイアログを表示し、外観や値を制御するために使用します。 -->
# Progressコンポーネント - ProgressDialog クラス

## 説明

このクラスは 4D Progress コンポーネントのラッパーメソッドで構成されています。このクラスを使用することで、各進捗ダイアログに名前でアクセスすることができるようになります。結果 progress id を気にすることなく、サブルーチンや他のプロセスからも進捗ダイアログにアクセスすることができます。

## コンストラクタ

### cs.Progress.ProgressDialog.new(name : Text{; option : Object})

進捗ダイアログの名前を `name` に渡します。同じ名前を使用してインスタンス化された進捗ダイアログオブジェクトは、サブルーチンや他のプロセスにおいても同じ進捗ダイアログを参照します。

`option` を使用して進捗ダイアログの表示に関わる設定を行うことができます。以下のプロパティを設定可能です：

|プロパティ名|型|説明|
|:---------|:--|:--|
|buttonEnabled|Boolean|停止ボタンの表示設定。デフォルトは非表示。|
|buttonTitle|Text|停止ボタンのタイトル (Windows OSのみ有効)|
|icon|Picture|進捗ダイアログに表示するアイコン|
|message|Text|進捗ダイアログの詳細メッセージ|
|progress|Real|進捗バーの値 (-1 または 0~1)|
|stopEventListener|Text|停止ボタンがクリックされた際に実行されるコールバックメソッド名|
|title|Text|進捗ダイアログのメインタイトル|

<a id="constructor-sample-code"></a>
#### サンプルコード
```4d
var $i; $max_l : Integer
var $value_o : Object
var $progress_o : cs.Progress.ProgressDialog

$progress_o:=cs.Progress.ProgressDialog.new("LoopThroughSelection")
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
  If ($progress_o.canceled)
    break
  End if 
End for 
$progress_o.stop()
```

```4d
var $progress_o : cs.Progress.ProgressDialog
var $option_o : Object
$option_o:={buttonEnabled: True; title: "Preparing"; progress: -1}
$progress_o:=cs.Progress.ProgressDialog.new("LoopThroughSelection"; $option_o)
```

## 関数・プロパティ

### .buttonEnabled : Boolean

`buttonEnabled` プロパティを使用して停止ボタンの表示・非表示状態を設定します。デフォルトで停止ボタンは表示されません。ボタンを表示するには `True` を設定します。

#### サンプルコード

```4d
var $enabled_b : Boolean
var $progress_o : cs.Progress.ProgressDialog
$progress_o:=cs.Progress.ProgressDialog.new("LoopThroughSelection")
$progress_o.buttonEnabled:=True
$enabled_b:=$progress_o.buttonEnabled  // True
```

### .buttonTitle : Text

(このプロパティは Windows OS でのみ意味を持ちます)

`buttonTitle` プロパティを使用して停止ボタンのタイトル文字列を設定・取得できます。

#### サンプルコード

```4d
var $buttonTitle_t : Text
var $progress_o : cs.Progress.ProgressDialog
$progress_o:=cs.Progress.ProgressDialog.new("LoopThroughSelection")
$progress_o.buttonTitle:="停止"
$buttonTitle_t:=$progress_o.buttonTitle  // 停止
```

### .canceled : Boolean

`canceled` プロパティはユーザーにより停止ボタンがクリックされたかどうかを示すブール値を返します。クリックされた場合は True を、そうでなければ False を返します。これは読み出しのみ属性です。

#### サンプルコード

コンストラクターの[サンプルコード](#constructor-sample-code)を参照

### .icon : Picture

`icon` プロパティを使用して進捗ダイアログに表示されるアイコン画像を設定・取得できます。

画像サイズは以下の通りです

- Windows OS : 80 x 40 px
- macOS : 40 x 40 px

これを超えるサイズの画像は縮小されます。

#### サンプルコード

```4d
var $icon_g : Picture
var $progress_o : cs.Progress.ProgressDialog
$progress_o:=cs.Progress.ProgressDialog.new("LoopThroughSelection")
$progress_o.icon:=$icon_g
$icon_g:=$progress_o.icon
```

### .message : Text

`message` プロパティを使用して、進捗ダイアログ画面上、タイトルの下 (Windows OS) や進捗バーの下 (macOS) に表示されるメッセージテキストを設定・取得します。

#### サンプルコード

```4d
var $i : Integer
var $selection_o : 4D.EntitySelection
var $progress_o : cs.Progress.ProgressDialog
$progress_o:=cs.Progress.ProgressDialog.new("LoopThroughSelection")
$progress_o.start()
For($i; 0; $selection_o.length-1)
    $progress_o.message:="Processing "+String($i+1)+" / "+String($selection_o.length)+" entities."
    $message_t:=$progress_o.message
End for
```

### .stopEventListener : Text

`stopEventListener` プロパティを使用して、ユーザーが停止ボタンをクリックした際に発行される Stop イベントのリスナーメソッドを設定・取得できます。

イベントリスナーメソッドに関する詳細は4Dの `Progress SET ON STOP METHOD` 関数のマニュアルを参照してください。

#### サンプルコード

```4d
var $method_t : Text
var $progress_o : cs.Progress.ProgressDialog
$progress_o:=cs.Progress.ProgressDialog.new("LoopThroughSelection")
$progress_o.start()
$progress_o.stopEventListener:="funcOnStop"
$method_t:=$progress_o.stopEventListener  // "funcOnStop"
```

### .progress : Real

`progress` プロパティを使用して進捗バーの現在値にアクセスします。値の範囲は 0 から 1 までの実数で、-1 を渡すと進行状況不定の進捗バーが表示されます。

#### サンプルコード

```4d
var $i : Integer
var $progress_r : Real
var $selection_o : 4D.EntitySelection
var $progress_o : cs.Progress.ProgressDialog
$progress_o:=cs.Progress.ProgressDialog.new("LoopThroughSelection")
$progress_o.start()
For($i; 0; $selection_o.length-1)
    $progress_o.progress:=($i+1)/$selection_o.length
    $progress_r:=$progress_o.progress
End for
```

### .setProgress(value : object)

この関数を使用して進捗バーの値やタイトル、およびメッセージを一括して設定できます。

オブジェクト型の `value` 引数には以下のプロパティを設定します：

|プロパティ名|型|説明|
|:---------|:--|:--|
|progress|Real|進捗バーの値 (-1 または 0~1)|
|title|Text|進捗ダイアログのメインタイトル|
|message|Text|進捗ダイアログの詳細メッセージ|

各プロパティは省略可能です。

または

|プロパティ名|型|説明|
|:---------|:--|:--|
|counter|Integer|進捗の現在値|
|end|Integer|進捗の終了値|
|title|Text|進捗ダイアログのメインタイトル|
|message|Text|進捗ダイアログの詳細メッセージ|

後者の場合、`message` には以下のテンプレートリテラルを指定することができます：

|置き換え文字列|説明|注|
|:---------|:--|:--|
|"${counter}"|`value.counter`の値と置換されます|`value.counter`必須|
|"${end}"|`value.end`の値と置換されます|`value.end`必須|
|"${timeRemaining}"|`value.counter`と`value.end`および経過時間から計算した残り時間|`value.counter`と`value.end`必須|

#### サンプルコード

コンストラクターの[サンプルコード](#constructor-sample-code)を参照

```4d
var $i; $max_l : Integer
var $value_o : Object
var $progress_o : cs.Progress.ProgressDialog

$progress_o:=cs.Progress.ProgressDialog.new("LoopThroughSelection")
$progress_o.buttonEnabled:=True
$progress_o.title:="Preparing..."
$progress_o.progress:=-1
$progress_o.start()

$max_l:=100
$value_o:={}
$value_o.title:="Calculating"
$value_o.end:=$max_l
$value_o.message:="${counter} / ${end} 残り時間 : ${timeRemaining}"
For ($i; 1; $max_l)
  $value_o.counter:=$i
  $progress_o.setProgress($value_o)
  If ($progress_o.canceled)
    break
  End if 
End for 
$progress_o.stop()
```

### .start()

この関数は進捗ウィンドウに新しい進捗ダイアログを追加します。同じ名前を持つダイアログがすでに存在する場合はなにも行いません。

#### サンプルコード

```4d
var $progress_o : cs.Progress.ProgressDialog
$progress_o:=cs.Progress.ProgressDialog.new("LoopThroughSelection")
$progress_o.start()
```

### .stop()

この関数は対応する進捗ダイアログを進捗ウィンドウから取り除きます。

#### サンプルコード

```4d
var $progress_o : cs.Progress.ProgressDialog
$progress_o:=cs.Progress.ProgressDialog.new("LoopThroughSelection")
$progress_o.start()
// 作業を行う
$progress_o.stop()
```

### .title : Text

`title` プロパティを使用して、進捗ダイアログ画面上部に表示されるタイトルテキストを設定・取得します。

#### サンプルコード

```4d
var $title_t : Text
var $progress_o : cs.Progress.ProgressDialog
$progress_o:=cs.Progress.ProgressDialog.new("LoopThroughSelection")
$progress_o.start()
For($i; 0; $selection_o.length-1)
    $progress_o.title:="In progress"
    $title_t:=$progress_o.title
End for
```
