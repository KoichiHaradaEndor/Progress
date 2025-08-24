<!-- The ProgressWindow class consists of wrapper methods for the 4D Progress component and is used to set appearance of the progress window. -->
# Progress component - ProgressWindow class

## Description

This class consists of wrapper methods for the 4D Progress component. Using this class allows you to configure the appearance of the progress window such as hide or show status, position of the window and fonts used in the progress dialogs. Also you can set and retrieve error event listener for 4D Progress component.

This is shared singleton class.

## Constructor

### cs.Progress.ProgressWindow.me

## Function, Property

### .errorEventListener : Text

By using `errorEventListener` property, you can set and retrieve name of the Error event listener method which is called when errors are generated in 4D Progress component methods.

For details about event listener method, refer to the manual of the `Progress SET ON ERROR METHOD` function.

#### Sample code

```4d
var $method_t : Text
var $progressWindow_o : cs.Progress.ProgressWindow
$progressWindow_o:=cs.Progress.ProgressWindow.me
$progressWindow_o.errorEventListener:="funcOnError"
$method_t:=$progressWindow_o.errorEventListener // "funcOnError"
```

### .hide()

This function is used to hide the progress window.
<a id="hide-sample-code"></a>
#### Sample code

```4d
var $progressWindow_o : cs.Progress.ProgressWindow
$progressWindow_o:=cs.Progress.ProgressWindow.me
$progressWindow_o.hide()
$progressWindow_o.show()
```

### .move(hPos : Integer; vPos : Integer)

This function is used to move the progress window to the position designated by the `hPos` and the `vPos` parameter. Those paramters indicate top left corner of the window.

#### Sample code

```4d
var $progressWindow_o : cs.Progress.ProgressWindow
$progressWindow_o:=cs.Progress.ProgressWindow.me
$progressWindow_o.setCoordinates(10;30)
```

### .fonts(setting : Object)

You can use this function to set font size and/or font names of the text used in progress window. The settings are applied to every progress dialogs.

The structure of the `setting` parameter is as follows:

|1st Level|2nd Level|Value type|
|:--------|:--------|:--------:|
|title|fontSize|Integer|
||fontName|Text|
|message|fontSize|Integer|
||fontName|Text|
|button|fontSize|Integer|
||fontName|Text|

You can omit some properties when you do not want to change them. When the first level is omitted, both font size and font name are not changed.

#### Sample code

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

This function is used to show the progress window which is hidden by `.hide()` function.

#### Sample code

Refer to the [Sample code](#hide-sample-code) of the `.hide()` function.
