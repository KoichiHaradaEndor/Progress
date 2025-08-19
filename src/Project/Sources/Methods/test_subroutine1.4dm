//%attributes = {}
/**
* Run test_subroutine1 first, then run test_subroutine2.
* Tests progress window that has the same name can be accessed 
* from subroutine.
*/

If (Count parameters:C259=0)
	
	CALL WORKER:C1389("test_subroutine"; Formula:C1597(test_subroutine1); "exec")
	
Else 
	
	var $progress_o : cs:C1710.Progress
	
	$progress_o:=cs:C1710.Progress.new("test-subroutine")
	$progress_o.title:="Test Subroutine"
	$progress_o.message:="Preparing..."
	$progress_o.progress:=-1
	$progress_o.buttonEnabled:=True:C214
	$progress_o.start()
	DELAY PROCESS:C323(Current process:C322; 120)
	
	test_subroutine2
	
End if 

