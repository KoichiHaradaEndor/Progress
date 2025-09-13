//%attributes = {}
var $progress_o : cs:C1710.ProgressDialog
var $i; $max_l : Integer
var $option_o : Object

$progress_o:=cs:C1710.ProgressDialog.new("test")

$progress_o.title:="Preparing..."
$progress_o.progress:=-1
$progress_o.start()
DELAY PROCESS:C323(Current process:C322; 120)

$progress_o.buttonEnabled:=True:C214
$progress_o.buttonTitle:="停止"  // Windows only

$max_l:=10000
$option_o:={}
$option_o.title:="Processing"
$option_o.end:=$max_l
$option_o.message:="${counter} / ${end} Time remaining : ${timeRemaining}"
For ($i; 1; $max_l)
	$option_o.counter:=$i
	$progress_o.setProgress($option_o)
	DELAY PROCESS:C323(Current process:C322; 10)
	If ($progress_o.canceled)
		break
	End if 
End for 
$progress_o.stop()

