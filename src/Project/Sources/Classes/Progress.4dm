/**
* A Progress dialog consists of :
*  Title: Main text of the progress window
*  Message: Description displayed under the main title (Windows) or under the progress bar (macOS)
*  Progress: Value of the progress bar (range 0-1)
*/

property _name : Text
property _buttonEnabled : Boolean
property _buttonTitle : Text
property _progress : Real
property _title : Text
property _message : Text
property _icon : Picture
property _stopEventListener : Text
property _errorEventListener : Text

Class constructor($name_t : Text; $options_o : Object)
	
	This:C1470._name:=$name_t || "__ANONYMOUS_PROGRESS__"
	
	If (Count parameters:C259>=2)
		This:C1470._buttonEnabled:=(($options_o.buttonEnabled#Null:C1517) && (Value type:C1509($options_o.buttonEnabled)=Is boolean:K8:9)) ? $options_o.buttonEnabled : Null:C1517
		This:C1470._buttonTitle:=(($options_o.buttonTitle#Null:C1517) && (Value type:C1509($options_o.buttonTitle)=Is text:K8:3)) ? $options_o.buttonTitle : Null:C1517
		This:C1470._progress:=(($options_o.progress#Null:C1517) && (Value type:C1509($options_o.progress)=Is real:K8:4)) ? $options_o.progress : Null:C1517
		This:C1470._title:=(($options_o.title#Null:C1517) && (Value type:C1509($options_o.title)=Is text:K8:3)) ? $options_o.title : Null:C1517
		This:C1470._message:=(($options_o.message#Null:C1517) && (Value type:C1509($options_o.message)=Is text:K8:3)) ? $options_o.message : Null:C1517
		This:C1470._icon:=(($options_o.icon#Null:C1517) && (Value type:C1509($options_o.icon)=Is picture:K8:10)) ? $options_o.icon : Null:C1517
		This:C1470._stopEventListener:=(($options_o.stopEventListener#Null:C1517) && (Value type:C1509($options_o.stopEventListener)=Is text:K8:3)) ? $options_o.stopEventListener : Null:C1517
		This:C1470._errorEventListener:=(($options_o.errorEventListener#Null:C1517) && (Value type:C1509($options_o.errorEventListener)=Is text:K8:3)) ? $options_o.errorEventListener : Null:C1517
	End if 
	
	//MARK: プロパティ
Function get buttonEnabled() : Boolean
	
	var $name_t : Text
	var $id_l : Integer
	var $_progressWindow_o : cs:C1710._ProgressWindow
	var $enabled_b : Boolean
	
	If (This:C1470._buttonEnabled#Null:C1517)
		return This:C1470._buttonEnabled
	End if 
	
	$name_t:=This:C1470._name
	$_progressWindow_o:=cs:C1710._ProgressWindow.me
	If ($_progressWindow_o.has($name_t)=False:C215)
		return 
	End if 
	
	$id_l:=$_progressWindow_o.getId($name_t)
	$enabled_b:=Progress Get Button Enabled($id_l)
	return $enabled_b
	
Function set buttonEnabled($enabled_b : Boolean)
	
	var $name_t : Text
	var $id_l : Integer
	var $_progressWindow_o : cs:C1710._ProgressWindow
	
	This:C1470._buttonEnabled:=$enabled_b
	
	$name_t:=This:C1470._name
	$_progressWindow_o:=cs:C1710._ProgressWindow.me
	If ($_progressWindow_o.has($name_t)=False:C215)
		return 
	End if 
	
	$id_l:=$_progressWindow_o.getId($name_t)
	Progress SET BUTTON ENABLED($id_l; $enabled_b)
	
Function get buttonTitle() : Text
	
	var $name_t : Text
	var $id_l : Integer
	var $_progressWindow_o : cs:C1710._ProgressWindow
	var $title_t : Text
	
	If (This:C1470._buttonTitle#Null:C1517)
		return This:C1470._buttonTitle
	End if 
	
	$name_t:=This:C1470._name
	$_progressWindow_o:=cs:C1710._ProgressWindow.me
	If ($_progressWindow_o.has($name_t)=False:C215)
		return 
	End if 
	
	$id_l:=$_progressWindow_o.getId($name_t)
	$title_t:=Progress Get Button Title($id_l)
	return $title_t
	
Function set buttonTitle($title_t : Text)
	
	var $name_t : Text
	var $id_l : Integer
	var $_progressWindow_o : cs:C1710._ProgressWindow
	
	This:C1470._buttonTitle:=$title_t
	
	$name_t:=This:C1470._name
	$_progressWindow_o:=cs:C1710._ProgressWindow.me
	If ($_progressWindow_o.has($name_t)=False:C215)
		return 
	End if 
	
	$id_l:=$_progressWindow_o.getId($name_t)
	Progress SET BUTTON TITLE($id_l; $title_t)
	
Function get stopped() : Boolean
	
	var $name_t : Text
	var $id_l : Integer
	var $_progressWindow_o : cs:C1710._ProgressWindow
	var $stopped_b : Boolean
	
	$name_t:=This:C1470._name
	$_progressWindow_o:=cs:C1710._ProgressWindow.me
	If ($_progressWindow_o.has($name_t)=False:C215)
		return 
	End if 
	
	$id_l:=$_progressWindow_o.getId($name_t)
	$stopped_b:=Progress Stopped($id_l)
	return $stopped_b
	
Function get icon() : Picture
	
	var $name_t : Text
	var $id_l : Integer
	var $_progressWindow_o : cs:C1710._ProgressWindow
	var $message_t : Text
	var $icon_g : Picture
	
	If (This:C1470._icon#Null:C1517)
		return This:C1470._icon
	End if 
	
	$name_t:=This:C1470._name
	$_progressWindow_o:=cs:C1710._ProgressWindow.me
	If ($_progressWindow_o.has($name_t)=False:C215)
		return 
	End if 
	
	$id_l:=$_progressWindow_o.getId($name_t)
	$icon_g:=Progress Get Icon($id_l)
	return $icon_g
	
Function set icon($icon_g : Picture)
	
	var $name_t : Text
	var $id_l : Integer
	var $_progressWindow_o : cs:C1710._ProgressWindow
	var $message_t : Text
	var $width_r; $height_r; $maxWidth_r; $maxHeight_r; $ratio_r; $ratioWidth_r; $ratioHeight_r : Real
	
	PICTURE PROPERTIES:C457($icon_g; $width_r; $height_r)
	Case of 
		: (Is macOS:C1572)
			$maxWidth_r:=40
			$maxHeight_r:=40
		: (Is Windows:C1573)
			$maxWidth_r:=80
			$maxHeight_r:=40
	End case 
	
	Case of 
		: ($width_r>$maxWidth_r) && ($height_r>$maxHeight_r)
			$ratioWidth_r:=$maxWidth_r/$width_r
			$ratioHeight_r:=$maxHeight_r/$height_r
			Case of 
				: ($ratioWidth_r>$ratioHeight_r)
					$width_r:=Int:C8($width_r*$ratioHeight_r)
					$height_r:=$maxHeight_r
				: ($ratioWidth_r<$ratioHeight_r)
					$width_r:=$maxWidth_r
					$height_r:=Int:C8($height_r*$ratioWidth_r)
				Else 
					$width_r:=Int:C8($width_r*$ratioHeight_r)
					$height_r:=Int:C8($height_r*$ratioWidth_r)
			End case 
		: ($width_r>$maxWidth_r)
			$ratioWidth_r:=$maxWidth_r/$width_r
			$width_r:=$maxWidth_r
			$height_r:=Int:C8($height_r*$ratioWidth_r)
		: ($height_r>$maxHeight_r)
			$ratioHeight_r:=$maxHeight_r/$height_r
			$width_r:=Int:C8($width_r*$ratioHeight_r)
			$height_r:=$maxHeight_r
	End case 
	
	CREATE THUMBNAIL:C679($icon_g; $icon_g; $width_r; $height_r)
	This:C1470._icon:=$icon_g
	
	$name_t:=This:C1470._name
	$_progressWindow_o:=cs:C1710._ProgressWindow.me
	If ($_progressWindow_o.has($name_t)=False:C215)
		return 
	End if 
	
	$id_l:=$_progressWindow_o.getId($name_t)
	Progress SET ICON($id_l; $icon_g)
	
Function get message() : Text
	
	var $name_t : Text
	var $id_l : Integer
	var $_progressWindow_o : cs:C1710._ProgressWindow
	var $message_t : Text
	
	If (This:C1470._message#Null:C1517)
		return This:C1470._message
	End if 
	
	$name_t:=This:C1470._name
	$_progressWindow_o:=cs:C1710._ProgressWindow.me
	If ($_progressWindow_o.has($name_t)=False:C215)
		return 
	End if 
	
	$id_l:=$_progressWindow_o.getId($name_t)
	$message_t:=Progress Get Message($id_l)
	return $message_t
	
Function set message($message_t : Text)
	
	var $name_t : Text
	var $id_l : Integer
	var $_progressWindow_o : cs:C1710._ProgressWindow
	
	This:C1470._message:=$message_t
	
	$name_t:=This:C1470._name
	$_progressWindow_o:=cs:C1710._ProgressWindow.me
	If ($_progressWindow_o.has($name_t)=False:C215)
		return 
	End if 
	
	$id_l:=$_progressWindow_o.getId($name_t)
	Progress SET MESSAGE($id_l; $message_t)
	
Function get stopEventListener() : Text
	
	var $name_t : Text
	var $id_l : Integer
	var $_progressWindow_o : cs:C1710._ProgressWindow
	var $methodName_t : Text
	
	If (This:C1470._stopEventListener#Null:C1517)
		return This:C1470._stopEventListener
	End if 
	
	$name_t:=This:C1470._name
	$_progressWindow_o:=cs:C1710._ProgressWindow.me
	If ($_progressWindow_o.has($name_t)=False:C215)
		return 
	End if 
	
	$id_l:=$_progressWindow_o.getId($name_t)
	$methodName_t:=Progress Get On Stop Method($id_l)
	return $methodName_t
	
Function set stopEventListener($methodName_t : Text)
	
	var $name_t : Text
	var $id_l : Integer
	var $_progressWindow_o : cs:C1710._ProgressWindow
	
	This:C1470._stopEventListener:=$methodName_t
	
	$name_t:=This:C1470._name
	$_progressWindow_o:=cs:C1710._ProgressWindow.me
	If ($_progressWindow_o.has($name_t)=False:C215)
		return 
	End if 
	
	$id_l:=$_progressWindow_o.getId($name_t)
	Progress SET ON STOP METHOD($id_l; $methodName_t)
	
Function get progress() : Real
	
	var $name_t : Text
	var $id_l : Integer
	var $_progressWindow_o : cs:C1710._ProgressWindow
	var $progress_r : Real
	
	If (This:C1470._progress#Null:C1517)
		return This:C1470._progress
	End if 
	
	$name_t:=This:C1470._name
	$_progressWindow_o:=cs:C1710._ProgressWindow.me
	If ($_progressWindow_o.has($name_t)=False:C215)
		return 
	End if 
	
	$id_l:=$_progressWindow_o.getId($name_t)
	$progress_r:=Progress Get Progress($id_l)
	return $progress_r
	
Function set progress($progress_r : Real)
	
	var $name_t : Text
	var $id_l : Integer
	var $_progressWindow_o : cs:C1710._ProgressWindow
	
	This:C1470._progress:=$progress_r
	
	$name_t:=This:C1470._name
	$_progressWindow_o:=cs:C1710._ProgressWindow.me
	If ($_progressWindow_o.has($name_t)=False:C215)
		return 
	End if 
	
	$id_l:=$_progressWindow_o.getId($name_t)
	Progress SET PROGRESS($id_l; $progress_r)
	
Function get title() : Text
	
	var $name_t : Text
	var $id_l : Integer
	var $_progressWindow_o : cs:C1710._ProgressWindow
	var $title_t : Text
	
	If (This:C1470._title#Null:C1517)
		return This:C1470._title
	End if 
	
	$name_t:=This:C1470._name
	$_progressWindow_o:=cs:C1710._ProgressWindow.me
	If ($_progressWindow_o.has($name_t)=False:C215)
		return 
	End if 
	
	$id_l:=$_progressWindow_o.getId($name_t)
	$title_t:=Progress Get Title($id_l)
	return $title_t
	
Function set title($title_t : Text)
	
	var $name_t : Text
	var $id_l : Integer
	var $_progressWindow_o : cs:C1710._ProgressWindow
	
	This:C1470._title:=$title_t
	
	$name_t:=This:C1470._name
	$_progressWindow_o:=cs:C1710._ProgressWindow.me
	If ($_progressWindow_o.has($name_t)=False:C215)
		return 
	End if 
	
	$id_l:=$_progressWindow_o.getId($name_t)
	Progress SET TITLE($id_l; $title_t)
	
	//MARK: 関数
	
Function setProgress($value_o : Object)
	
/**
* value:={
*   progress : Real,
*   title : Text,
*   message : Text
* }
*/
	
	var $name_t : Text
	var $id_l; $type_l : Integer
	var $_progressWindow_o : cs:C1710._ProgressWindow
	
	This:C1470._progress:=(($value_o.progress#Null:C1517) && (Value type:C1509($value_o.progress)=Is real:K8:4)) ? $value_o.progress : Null:C1517
	This:C1470._title:=(($value_o.title#Null:C1517) && (Value type:C1509($value_o.title)=Is text:K8:3)) ? $value_o.title : Null:C1517
	This:C1470._message:=(($value_o.message#Null:C1517) && (Value type:C1509($value_o.message)=Is text:K8:3)) ? $value_o.message : Null:C1517
	
	$name_t:=This:C1470._name
	$_progressWindow_o:=cs:C1710._ProgressWindow.me
	If ($_progressWindow_o.has($name_t)=False:C215)
		return 
	End if 
	
	$id_l:=$_progressWindow_o.getId($name_t)
	If (OB Is defined:C1231($value_o; "progress") && (Value type:C1509($value_o.progress)=Is real:K8:4))
		$type_l:=Value type:C1509($value_o.progress)
		If (($type_l=Is real:K8:4) || ($type_l=Is longint:K8:6))
			Progress SET PROGRESS($id_l; $value_o.progress)
		End if 
	End if 
	If (OB Is defined:C1231($value_o; "title") && (Value type:C1509($value_o.title)=Is text:K8:3))
		Progress SET TITLE($id_l; $value_o.title)
	End if 
	If (OB Is defined:C1231($value_o; "message") && (Value type:C1509($value_o.message)=Is text:K8:3))
		Progress SET MESSAGE($id_l; $value_o.message)
	End if 
	
Function start()
	
	var $name_t : Text
	var $id_l : Integer
	var $_progressWindow_o : cs:C1710._ProgressWindow
	
	$name_t:=This:C1470._name
	$_progressWindow_o:=cs:C1710._ProgressWindow.me
	If ($_progressWindow_o.has($name_t))
		return 
	End if 
	
	$id_l:=Progress New
	$_progressWindow_o.add($name_t; $id_l)
	
	If (This:C1470._buttonEnabled#Null:C1517)
		Progress SET BUTTON ENABLED($id_l; This:C1470._buttonEnabled)
	End if 
	
	If (This:C1470._buttonTitle#Null:C1517)
		Progress SET BUTTON TITLE($id_l; This:C1470._buttonTitle)
	End if 
	
	If (This:C1470._progress#Null:C1517)
		Progress SET PROGRESS($id_l; This:C1470._progress)
	End if 
	
	If (This:C1470._title#Null:C1517)
		Progress SET TITLE($id_l; This:C1470._title)
	End if 
	
	If (This:C1470._message#Null:C1517)
		Progress SET MESSAGE($id_l; This:C1470._message)
	End if 
	
	If (This:C1470._icon#Null:C1517)
		Progress SET ICON($id_l; This:C1470._icon)
	End if 
	
	If (This:C1470._stopEventListener#Null:C1517)
		Progress SET ON STOP METHOD($id_l; This:C1470._stopEventListener)
	End if 
	
	If (This:C1470._errorEventListener#Null:C1517)
		Progress SET ON ERROR METHOD(This:C1470._errorEventListener)
	End if 
	
Function stop()
	
	var $name_t : Text
	var $id_l : Integer
	var $_progressWindow_o : cs:C1710._ProgressWindow
	
	$name_t:=This:C1470._name
	$_progressWindow_o:=cs:C1710._ProgressWindow.me
	If ($_progressWindow_o.has($name_t)=False:C215)
		return 
	End if 
	
	$id_l:=$_progressWindow_o.getId($name_t)
	Progress QUIT($id_l)
	$_progressWindow_o.remove($name_t)
	
	//MARK: グローバル設定
	
Function get errorEventListener() : Text
	
	var $methodName_t : Text
	
	If (This:C1470._errorEventListener#Null:C1517)
		return This:C1470._errorEventListener
	End if 
	
	$methodName_t:=Progress Get On Error Method()
	return $methodName_t
	
Function set errorEventListener($methodName_t : Text)
	
	This:C1470._errorEventListener:=$methodName_t
	Progress SET ON ERROR METHOD($methodName_t)
	
Function hide()
	
	Progress SET WINDOW VISIBLE(False:C215)
	
Function setCoordinates($horizontalPosition_l : Integer; $verticalPosition_l : Integer)
	
	Progress SET WINDOW VISIBLE(True:C214; $horizontalPosition_l; $verticalPosition_l)
	
Function setGlobalAppearance($settings_o : Object)
	
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
		$messageFontSize_l:=$DO_NOT_MODIFY_l
	End if 
	
	If ($settings_o.message#Null:C1517)
		$titleFontSize_l:=$settings_o.message.fontSize || $DO_NOT_MODIFY_l
		$titleFontName_t:=$settings_o.message.fontName || $DO_NOT_MODIFY_t
	Else 
		$titleFontSize_l:=$DO_NOT_MODIFY_l
		$messageFontSize_l:=$DO_NOT_MODIFY_l
	End if 
	
	If ($settings_o.button#Null:C1517)
		$titleFontSize_l:=$settings_o.button.fontSize || $DO_NOT_MODIFY_l
		$titleFontName_t:=$settings_o.button.fontName || $DO_NOT_MODIFY_t
	Else 
		$titleFontSize_l:=$DO_NOT_MODIFY_l
		$messageFontSize_l:=$DO_NOT_MODIFY_l
	End if 
	
	Progress SET FONT SIZES($titleFontSize_l; $messageFontSize_l; $buttonFontSize_l)
	Progress SET FONTS($titleFontName_t; $messageFontName_t; $buttonFontName_t)
	
Function show()
	
	Progress SET WINDOW VISIBLE(True:C214)
	