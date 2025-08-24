//%attributes = {}
/**
* Run test_subroutine1.
* Tests progress windows that has the same name can be accessed 
* from subroutine.
*/

var $progress_o : cs:C1710.ProgressDialog
var $i; $max_l : Integer

$progress_o:=cs:C1710.ProgressDialog.new("test-subroutine")

$max_l:=100
For ($i; 1; $max_l)
	$progress_o.setProgress({progress: $i/$max_l; title: "Test Subroutine"; message: String:C10($i)+" / "+String:C10($max_l)})
	DELAY PROCESS:C323(Current process:C322; 5)
	If ($progress_o.stopped)
		break
	End if 
End for 
$progress_o.stop()
