# Progress

This component provides wrapper methods for the 4D Progress component. Using this component allows you to access each progress dialog by name. As a result, you can access the progress dialog from subroutines and other processes without having to worry about the progress ID.

#### Sample code
```4d
var $i; $max_l : Integer
var $value_o : Object
var $progressDialog_o : cs.Progress.ProgressDialog

$progressDialog_o:=cs.Progress.ProgressDialog.new("LoopThroughSelection")
$progressDialog_o.buttonEnabled:=True
$progressDialog_o.title:="Preparing..."
$progressDialog_o.progress:=-1
$progressDialog_o.start()

$max_l:=100
$value_o:={}
For ($i; 1; $max_l)
  $value_o.progress:=$i/$max_l
  $value_o.title:="Processing"
  $value_o.message:=String($i)+" / "+String($max_l)
  $progressDialog_o.setProgress($value_o)
  If ($progressDialog_o.canceled)
    break
  End if 
End for 
$progressDialog_o.stop()
```