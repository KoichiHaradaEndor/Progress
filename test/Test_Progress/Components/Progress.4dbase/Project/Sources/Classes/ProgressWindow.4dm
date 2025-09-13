/**
* Progress window is a container which contains progress dialogs. 
*/

property _progressDialogs : Object
property _errorEventListener : Text

shared singleton Class constructor()
	
	This:C1470._progressDialogs:=New shared object:C1526
	
Function get errorEventListener() : Text
	
	var $methodName_t : Text
	
	If (This:C1470._errorEventListener#Null:C1517)
		return This:C1470._errorEventListener
	End if 
	
	$methodName_t:=Progress Get On Error Method()
	return $methodName_t
	
shared Function set errorEventListener($methodName_t : Text)
	
	If ($methodName_t="")
		OB REMOVE:C1226(This:C1470; "_errorEventListener")
	Else 
		This:C1470._errorEventListener:=$methodName_t
	End if 
	Progress SET ON ERROR METHOD($methodName_t)
	
Function hide()
	
	Progress SET WINDOW VISIBLE(False:C215)
	
Function move($horizontalPosition_l : Integer; $verticalPosition_l : Integer)
	
	Progress SET WINDOW VISIBLE(True:C214; $horizontalPosition_l; $verticalPosition_l)
	
Function fonts($settings_o : Object)
	
/**
* Settings: Object
*   title: {
*     fontSize: Integer
*     fontName: Text
*   }
*   message: {
*     fontSize: Integer
*     fontName: Text
*   }
*   button: {
*     fontSize: Integer
*     fontName: Text
*   }
*/
	
	var $DO_NOT_MODIFY_l : Integer:=-1
	var $DO_NOT_MODIFY_t : Text:=""
	
	var $titleFontSize_l; $messageFontSize_l; $buttonFontSize_l : Integer
	var $titleFontName_t; $messageFontName_t; $buttonFontName_t : Text
	
	If ($settings_o.title#Null:C1517)
		$titleFontSize_l:=$settings_o.title.fontSize || $DO_NOT_MODIFY_l
		$titleFontName_t:=$settings_o.title.fontName || $DO_NOT_MODIFY_t
	Else 
		$titleFontSize_l:=$DO_NOT_MODIFY_l
		$titleFontName_t:=$DO_NOT_MODIFY_t
	End if 
	
	If ($settings_o.message#Null:C1517)
		$messageFontSize_l:=$settings_o.message.fontSize || $DO_NOT_MODIFY_l
		$messageFontName_t:=$settings_o.message.fontName || $DO_NOT_MODIFY_t
	Else 
		$messageFontSize_l:=$DO_NOT_MODIFY_l
		$messageFontName_t:=$DO_NOT_MODIFY_t
	End if 
	
	If ($settings_o.button#Null:C1517)
		$buttonFontSize_l:=$settings_o.button.fontSize || $DO_NOT_MODIFY_l
		$buttonFontName_t:=$settings_o.button.fontName || $DO_NOT_MODIFY_t
	Else 
		$buttonFontSize_l:=$DO_NOT_MODIFY_l
		$buttonFontName_t:=$DO_NOT_MODIFY_t
	End if 
	
	Progress SET FONT SIZES($titleFontSize_l; $messageFontSize_l; $buttonFontSize_l)
	Progress SET FONTS($titleFontName_t; $messageFontName_t; $buttonFontName_t)
	
Function show()
	
	Progress SET WINDOW VISIBLE(True:C214)
	
shared Function _add($name_t : Text; $id_l : Integer)
	
	ASSERT:C1129($name_t#""; "name parameter is mandatory.")
	ASSERT:C1129($id_l>0; "id parameter is mandatory.")
	
	This:C1470._progressDialogs[$name_t]:=$id_l
	
shared Function _remove($name_t : Text)
	
	ASSERT:C1129($name_t#""; "name parameter is mandatory.")
	
	OB REMOVE:C1226(This:C1470._progressDialogs; $name_t)
	
shared Function _has($name_t : Text) : Boolean
	
/*
* Returns true if the progress window that has the given name exists in the _progress object, otherwise it returns false.
*/
	
	ASSERT:C1129($name_t#""; "name parameter is mandatory.")
	
	return (This:C1470._progressDialogs[$name_t]#Null:C1517) && (This:C1470._progressDialogs[$name_t]>0)
	
shared Function _getId($name_t : Text) : Integer
	
	ASSERT:C1129($name_t#""; "name parameter is mandatory.")
	
	If (This:C1470._has($name_t)=False:C215)
		return 0
	End if 
	
	return This:C1470._progressDialogs[$name_t]
	
	