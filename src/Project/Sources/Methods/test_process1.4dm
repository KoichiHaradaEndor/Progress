//%attributes = {}
/**
* Run test_process1 first, then run test_process2.
* Tests progress dialog that has the same name can be accessed 
* from different process.
*/

If (Count parameters:C259=0)
	
	CALL WORKER:C1389("test_process1"; Formula:C1597(test_process1); "exec")
	
Else 
	
	var $progress_o : cs:C1710.ProgressDialog
	
	$progress_o:=cs:C1710.ProgressDialog.new("test-process")
	$progress_o.title:="Test Process"
	$progress_o.message:="Preparing..."
	$progress_o.progress:=-1
	$progress_o.buttonEnabled:=True:C214
	$progress_o.start()
	
End if 

