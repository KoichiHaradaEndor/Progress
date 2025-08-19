# Progress

This component provides wrapper methods of 4D's Progress component.

#### Sample code
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