//%attributes = {}
/**
* Run test_process1 first, then run test_process2.
* Tests progress dialog that has the same name can be accessed 
* from different processes.
*/

If (Count parameters:C259=0)
	
	CALL WORKER:C1389("test_process2"; Formula:C1597(test_process2); "exec")
	
Else 
	
	var $progress_o : cs:C1710.ProgressDialog
	var $i; $max_l : Integer
	
	$progress_o:=cs:C1710.ProgressDialog.new("test-process")
	
	$max_l:=100
	For ($i; 1; $max_l)
		$progress_o.setProgress({progress: $i/$max_l; title: "Test Process"; message: String:C10($i)+" / "+String:C10($max_l)})
		DELAY PROCESS:C323(Current process:C322; 5)
		If ($progress_o.stopped)
			break
		End if 
	End for 
	$progress_o.stop()
	
End if 
