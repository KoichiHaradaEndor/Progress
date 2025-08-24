//%attributes = {}
var $progress_o : cs:C1710.ProgressDialog
var $i; $max_l : Integer

$progress_o:=cs:C1710.ProgressDialog.new("test")

$progress_o.title:="Preparing..."
$progress_o.progress:=-1
$progress_o.start()
DELAY PROCESS:C323(Current process:C322; 120)

$progress_o.buttonEnabled:=True:C214
$progress_o.buttonTitle:="停止"  // Windows only

$max_l:=100
For ($i; 1; $max_l)
	$progress_o.setProgress({progress: $i/$max_l; title: "Processing"; message: String:C10($i)+" / "+String:C10($max_l)})
	DELAY PROCESS:C323(Current process:C322; 5)
	If ($progress_o.stopped)
		break
	End if 
End for 
$progress_o.stop()
