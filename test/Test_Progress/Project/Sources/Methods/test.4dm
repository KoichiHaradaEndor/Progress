//%attributes = {}

var $progress_o : cs:C1710.Progress.ProgressDialog
var $max_l : Integer:=10000

$progress_o:=cs:C1710.Progress.ProgressDialog.new("Loop")
$progress_o.start()
For ($i; 1; $max_l)
	$progress_o.setProgress({\
		title: "Processing"; \
		end: $max_l; \
		counter: $i; \
		message: "${counter} / ${end} Time remaining : ${timeRemaining}"\
		})
End for 
$progress_o.stop()
