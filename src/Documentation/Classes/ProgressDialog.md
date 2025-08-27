<!-- The ProgressDialog class consists of wrapper methods for the 4D Progress component and is used to display progress dialogs and control their appearance and values. -->
# Progress component - ProgressDialog class

## Description

This class consists of wrapper methods for the 4D Progress component. Using this class allows you to access each progress dialog by name. As a result, you can access the progress dialog from subroutines and other processes without having to worry about the progress ID.

## Constructor

### cs.Progress.ProgressDialog.new(name : Text{; option : Object})

Pass the name of the progress dialog to `name`. Progress dialog objects instantiated with the same name refer to the same progress dialog in subroutines and other processes.

You can use `option` to configure settings related to the display of the progress dialog. The following properties can be set:

|Property Name|Value Type|Description|
|:---------|:--|:--|
|buttonEnabled|Boolean|True = Stop button displayed; otherwise, False (default)|
|buttonTitle|Text|Title of Stop button (Windows OS only)|
|icon|Picture|Icon of progress dialog|
|message|Text|Message of progress dialog|
|progress|Real|Value of progress bar (-1 or 0~1)|
|stopEventListener|Text|Name of stop method|
|title|Text|Title of progress dialog|

<a id="constructor-sample-code"></a>
#### Sample code
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

## Function, Property

### .buttonEnabled : Boolean

Use the `buttonEnabled` property to set whether the stop button is displayed or hidden. By default, the stop button is not displayed. Set it to `True` to display the button.

#### Sample code

```4d
var $enabled_b : Boolean
var $progress_o : cs.Progress.ProgressDialog
$progress_o:=cs.Progress.ProgressDialog.new("LoopThroughSelection")
$progress_o.buttonEnabled:=True
$enabled_b:=$progress_o.buttonEnabled  // True
```

### .buttonTitle : Text

(This property is only meaningful on Windows OS.)

You can set and retrieve the title string of the stop button using the `buttonTitle` property.

#### Sample code

```4d
var $buttonTitle_t : Text
var $progress_o : cs.Progress.ProgressDialog
$progress_o:=cs.Progress.ProgressDialog.new("LoopThroughSelection")
$progress_o.buttonTitle:="Stop"
$buttonTitle_t:=$progress_o.buttonTitle  // Stop
```

### .canceled : Boolean

The `canceled` property returns a Boolean value indicating whether the user clicked the stop button. If clicked, it returns True; otherwise, it returns False. This is a read-only attribute.

#### Sample code

Reder to [Sample code](#constructor-sample-code) of the constructor.

### .icon : Picture

You can set and retrieve the icon image of the progress dialog using the `icon` property.

Preferred image sizes are as follows:

- Windows OS : 80 x 40 px
- macOS : 40 x 40 px

Images larger than this size will be reduced.

#### Sample code

```4d
var $icon_g : Picture
var $progress_o : cs.Progress.ProgressDialog
$progress_o:=cs.Progress.ProgressDialog.new("LoopThroughSelection")
$progress_o.icon:=$icon_g
$icon_g:=$progress_o.icon
```

### .message : Text

Use the `message` property to set and retrieve the message text displayed below the title (Windows OS) or below the progress bar (macOS) on the progress dialog screen.

#### Sample code

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

By using `stopEventListener` property, you can set and retrieve name of the Stop event listener method which will be called when a user clicks on the Stop button in the progress dialog.

For details about event listener method, refer to the manual of the `Progress SET ON STOP METHOD` function.

#### Sample code

```4d
var $method_t : Text
var $progress_o : cs.Progress.ProgressDialog
$progress_o:=cs.Progress.ProgressDialog.new("LoopThroughSelection")
$progress_o.start()
$progress_o.stopEventListener:="funcOnStop"
$method_t:=$progress_o.stopEventListener  // "funcOnStop"
```

### .progress : Real

Use the `progress` property to access the current value of the progress bar. The value ranges from 0 to 1. Or passing -1 will display a progress bar with an undefined progress status.

#### Sample code

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

You can use this function to set the progress bar value, title, and message all at once.

In the object type `value` parameter, you can set the following properties:

|Property Name|Value Type|Description|
|:---------|:--|:--|
|progress|Real|Value of progress bar (-1 or 0~1)|
|title|Text|Title of progress dialog|
|message|Text|Message of progress dialog|

or

|Property Name|Value Type|Description|
|:---------|:--|:--|
|counter|Integer|Current value of the progress|
|end|Integer|End value of the progress|
|title|Text|Title of progress dialog|
|message|Text|Message of progress dialog|

each property can be omitted.

In the latter case, `message` can contain following template literals:

|String to replace|Description|Note|
|:---------|:--|:--|
|"${counter}"|to be replaced with the value of `value.counter`|`value.counter` is mandatory|
|"${end}"|to be replaced with the value of `value.end`|`value.end` is mandatory|
|"${timeRemaining}"|remaining time calculated based on `value.counter`, `value.end` and elapsed time|both `value.counter` and `value.end` are mandatory|

#### Sample code

Refer to the [Sample code](#constructor-sample-code) of the constructor.

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
$value_o.message:="${counter} / ${end} Time remaining : ${timeRemaining}"
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

This function appends new progress dialog to the progress window. If the dialog is the only instance of the window, the window is displayed. If the dialog instance that has the same name already exists, this function does nothing.

#### Sample code

```4d
var $progress_o : cs.Progress.ProgressDialog
$progress_o:=cs.Progress.ProgressDialog.new("LoopThroughSelection")
$progress_o.start()
```

### .stop()

This function removes the corresponding progress dialog from the progress window.

#### Sample code

```4d
var $progress_o : cs.Progress.ProgressDialog
$progress_o:=cs.Progress.ProgressDialog.new("LoopThroughSelection")
$progress_o.start()
// Do something
$progress_o.stop()
```

### .title : Text

You can set and retrieve the title string of the progress dialog using the `title` property.

#### Sample code

```4d
var $title_t : Text
var $progress_o : cs.Progress.ProgressDialog
$progress_o:=cs.Progress.ProgressDialog.new("LoopThroughSelection")
$progress_o.start()
For($i; 0; $selection_o.length-1)
    $progress_o.title:="In progress"
    $title_t:=$progress_o.title  // In progress
End for
```
