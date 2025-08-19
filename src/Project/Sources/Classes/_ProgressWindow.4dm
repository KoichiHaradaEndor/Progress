property _progress : Object

shared singleton Class constructor()
	
	This:C1470._progress:=New shared object:C1526
	
shared Function add($name_t : Text; $id_l : Integer)
	
	ASSERT:C1129($name_t#""; "name parameter is mandatory.")
	ASSERT:C1129($id_l>0; "id parameter is mandatory.")
	
	This:C1470._progress[$name_t]:=$id_l
	
shared Function remove($name_t : Text)
	
	ASSERT:C1129($name_t#""; "name parameter is mandatory.")
	
	OB REMOVE:C1226(This:C1470._progress; $name_t)
	
shared Function has($name_t : Text) : Boolean
	
/*
* Returns true if the progress window that has the given name exists in the _progress object, otherwise it returns false.
*/
	
	ASSERT:C1129($name_t#""; "name parameter is mandatory.")
	
	return (This:C1470._progress[$name_t]#Null:C1517)
	
shared Function getId($name_t : Text) : Integer
	
	ASSERT:C1129($name_t#""; "name parameter is mandatory.")
	
	If (This:C1470.has($name_t)=False:C215)
		return 0
	End if 
	
	return This:C1470._progress[$name_t]
	
	