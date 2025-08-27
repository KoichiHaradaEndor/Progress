/**
* A Progress dialog consists of :
*  Title: Name of the progress dialog
*  Message: Detail description displayed under the main title (Windows) or under the progress bar (macOS)
*  Progress: Value of the progress bar (range -1 or from 0 to 1)
*  Icon: Image displayed in the dialog
*  Stop button: when clicked, the progress dialog should be removed from the window and the process should be aborted
*/

property _name : Text
property _buttonEnabled : Boolean
property _buttonTitle : Text
property _progress : Real
property _title : Text
property _message : Text
property _icon : Picture
property _stopEventListener : Text
property _startTime : Integer

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
	End if 
	
	//MARK: Properties
	
Function get buttonEnabled() : Boolean
	
	var $name_t : Text
	var $id_l : Integer
	var $progressWindow_o : cs:C1710.ProgressWindow
	var $enabled_b : Boolean
	
	If (This:C1470._buttonEnabled#Null:C1517)
		return This:C1470._buttonEnabled
	End if 
	
	$name_t:=This:C1470._name
	$progressWindow_o:=cs:C1710.ProgressWindow.me
	If ($progressWindow_o._has($name_t)=False:C215)
		return False:C215
	End if 
	
	$id_l:=$progressWindow_o._getId($name_t)
	$enabled_b:=Progress Get Button Enabled($id_l)
	return $enabled_b
	
Function set buttonEnabled($enabled_b : Boolean)
	
	var $name_t : Text
	var $id_l : Integer
	var $progressWindow_o : cs:C1710.ProgressWindow
	
	This:C1470._buttonEnabled:=$enabled_b
	
	$name_t:=This:C1470._name
	$progressWindow_o:=cs:C1710.ProgressWindow.me
	If ($progressWindow_o._has($name_t)=False:C215)
		return 
	End if 
	
	$id_l:=$progressWindow_o._getId($name_t)
	Progress SET BUTTON ENABLED($id_l; $enabled_b)
	
Function get buttonTitle() : Text
	
	var $name_t : Text
	var $id_l : Integer
	var $progressWindow_o : cs:C1710.ProgressWindow
	var $title_t : Text
	
	If (This:C1470._buttonTitle#Null:C1517)
		return This:C1470._buttonTitle
	End if 
	
	$name_t:=This:C1470._name
	$progressWindow_o:=cs:C1710.ProgressWindow.me
	If ($progressWindow_o._has($name_t)=False:C215)
		return ""
	End if 
	
	$id_l:=$progressWindow_o._getId($name_t)
	$title_t:=Progress Get Button Title($id_l)
	return $title_t
	
Function set buttonTitle($title_t : Text)
	
	var $name_t : Text
	var $id_l : Integer
	var $progressWindow_o : cs:C1710.ProgressWindow
	
	This:C1470._buttonTitle:=$title_t
	
	$name_t:=This:C1470._name
	$progressWindow_o:=cs:C1710.ProgressWindow.me
	If ($progressWindow_o._has($name_t)=False:C215)
		return 
	End if 
	
	$id_l:=$progressWindow_o._getId($name_t)
	Progress SET BUTTON TITLE($id_l; $title_t)
	
Function get canceled() : Boolean
	
	var $name_t : Text
	var $id_l : Integer
	var $progressWindow_o : cs:C1710.ProgressWindow
	var $canceled_b : Boolean
	
	$name_t:=This:C1470._name
	$progressWindow_o:=cs:C1710.ProgressWindow.me
	If ($progressWindow_o._has($name_t)=False:C215)
		return False:C215
	End if 
	
	$id_l:=$progressWindow_o._getId($name_t)
	$canceled_b:=Progress Stopped($id_l)
	return $canceled_b
	
Function get icon() : Picture
	
	var $name_t : Text
	var $id_l : Integer
	var $progressWindow_o : cs:C1710.ProgressWindow
	var $message_t : Text
	var $icon_g : Picture
	
	If (This:C1470._icon#Null:C1517)
		return This:C1470._icon
	End if 
	
	$name_t:=This:C1470._name
	$progressWindow_o:=cs:C1710.ProgressWindow.me
	If ($progressWindow_o._has($name_t)=False:C215)
		return $icon_g
	End if 
	
	$id_l:=$progressWindow_o._getId($name_t)
	$icon_g:=Progress Get Icon($id_l)
	return $icon_g
	
Function set icon($icon_g : Picture)
	
	var $name_t : Text
	var $id_l : Integer
	var $progressWindow_o : cs:C1710.ProgressWindow
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
	$progressWindow_o:=cs:C1710.ProgressWindow.me
	If ($progressWindow_o._has($name_t)=False:C215)
		return 
	End if 
	
	$id_l:=$progressWindow_o._getId($name_t)
	Progress SET ICON($id_l; $icon_g)
	
Function get message() : Text
	
	var $name_t : Text
	var $id_l : Integer
	var $progressWindow_o : cs:C1710.ProgressWindow
	var $message_t : Text
	
	If (This:C1470._message#Null:C1517)
		return This:C1470._message
	End if 
	
	$name_t:=This:C1470._name
	$progressWindow_o:=cs:C1710.ProgressWindow.me
	If ($progressWindow_o._has($name_t)=False:C215)
		return ""
	End if 
	
	$id_l:=$progressWindow_o._getId($name_t)
	$message_t:=Progress Get Message($id_l)
	return $message_t
	
Function set message($message_t : Text)
	
	var $name_t : Text
	var $id_l : Integer
	var $progressWindow_o : cs:C1710.ProgressWindow
	
	This:C1470._message:=$message_t
	
	$name_t:=This:C1470._name
	$progressWindow_o:=cs:C1710.ProgressWindow.me
	If ($progressWindow_o._has($name_t)=False:C215)
		return 
	End if 
	
	$id_l:=$progressWindow_o._getId($name_t)
	Progress SET MESSAGE($id_l; $message_t)
	
Function get stopEventListener() : Text
	
	var $name_t : Text
	var $id_l : Integer
	var $progressWindow_o : cs:C1710.ProgressWindow
	var $methodName_t : Text
	
	If (This:C1470._stopEventListener#Null:C1517)
		return This:C1470._stopEventListener
	End if 
	
	$name_t:=This:C1470._name
	$progressWindow_o:=cs:C1710.ProgressWindow.me
	If ($progressWindow_o._has($name_t)=False:C215)
		return ""
	End if 
	
	$id_l:=$progressWindow_o._getId($name_t)
	$methodName_t:=Progress Get On Stop Method($id_l)
	return $methodName_t
	
Function set stopEventListener($methodName_t : Text)
	
	var $name_t : Text
	var $id_l : Integer
	var $progressWindow_o : cs:C1710.ProgressWindow
	
	This:C1470._stopEventListener:=$methodName_t
	
	$name_t:=This:C1470._name
	$progressWindow_o:=cs:C1710.ProgressWindow.me
	If ($progressWindow_o._has($name_t)=False:C215)
		return 
	End if 
	
	$id_l:=$progressWindow_o._getId($name_t)
	Progress SET ON STOP METHOD($id_l; $methodName_t)
	
Function get progress() : Real
	
	var $name_t : Text
	var $id_l : Integer
	var $progressWindow_o : cs:C1710.ProgressWindow
	var $progress_r : Real
	
	If (This:C1470._progress#Null:C1517)
		return This:C1470._progress
	End if 
	
	$name_t:=This:C1470._name
	$progressWindow_o:=cs:C1710.ProgressWindow.me
	If ($progressWindow_o._has($name_t)=False:C215)
		return 0
	End if 
	
	$id_l:=$progressWindow_o._getId($name_t)
	$progress_r:=Progress Get Progress($id_l)
	return $progress_r
	
Function set progress($progress_r : Real)
	
	var $name_t : Text
	var $id_l : Integer
	var $progressWindow_o : cs:C1710.ProgressWindow
	
	This:C1470._progress:=$progress_r
	
	$name_t:=This:C1470._name
	$progressWindow_o:=cs:C1710.ProgressWindow.me
	If ($progressWindow_o._has($name_t)=False:C215)
		return 
	End if 
	
	$id_l:=$progressWindow_o._getId($name_t)
	Progress SET PROGRESS($id_l; $progress_r)
	
Function get title() : Text
	
	var $name_t : Text
	var $id_l : Integer
	var $progressWindow_o : cs:C1710.ProgressWindow
	var $title_t : Text
	
	If (This:C1470._title#Null:C1517)
		return This:C1470._title
	End if 
	
	$name_t:=This:C1470._name
	$progressWindow_o:=cs:C1710.ProgressWindow.me
	If ($progressWindow_o._has($name_t)=False:C215)
		return ""
	End if 
	
	$id_l:=$progressWindow_o._getId($name_t)
	$title_t:=Progress Get Title($id_l)
	return $title_t
	
Function set title($title_t : Text)
	
	var $name_t : Text
	var $id_l : Integer
	var $progressWindow_o : cs:C1710.ProgressWindow
	
	This:C1470._title:=$title_t
	
	$name_t:=This:C1470._name
	$progressWindow_o:=cs:C1710.ProgressWindow.me
	If ($progressWindow_o._has($name_t)=False:C215)
		return 
	End if 
	
	$id_l:=$progressWindow_o._getId($name_t)
	Progress SET TITLE($id_l; $title_t)
	
	//MARK: Functions
	
Function setProgress($value_o : Object)
	
/**
* Structure 1:
* value:={
*   progress : Real,
*   title : Text,
*   message : Text
* }
*
* Structure 2:
* value:={
*   counter : Real,
*   end : Real,
*   title : Text,
*   message : Text
* }
* in the message text, template literal is supported. 
* ex  ${counter} / ${end}
*/
	
	var $name_t; $message_t; $timeRemaining_t : Text
	var $counter_b; $end_b : Boolean
	var $counter_r; $end_r; $initialCounterRange_r; $elapsed_r; $toProcessMilliSec_r : Real
	var $toProcessSec_l; $days_l : Integer
	
	$counter_b:=(($value_o.counter#Null:C1517) && (Value type:C1509($value_o.counter)=Is real:K8:4))
	$end_b:=(($value_o.end#Null:C1517) && (Value type:C1509($value_o.end)=Is real:K8:4) && ($value_o.end#0))
	
	// setting progress
	Case of 
		: ($counter_b && $end_b)  // counterとendが指定されている時
			This:C1470.progress:=$value_o.counter/$value_o.end
			
		: ($value_o.progress#Null:C1517) && (Value type:C1509($value_o.progress)=Is real:K8:4)  // progressが設定されている時
			This:C1470.progress:=$value_o.progress
			
	End case 
	
	// setting title
	If ($value_o.title#Null:C1517) && (Value type:C1509($value_o.title)=Is text:K8:3)
		This:C1470.title:=$value_o.title
	End if 
	
	// setting message
	If ($value_o.message#Null:C1517) && (Value type:C1509($value_o.message)=Is text:K8:3)
		
		$message_t:=$value_o.message
		
		// replacing ${counter}
		If ((Position:C15("${counter}"; $message_t)>0) && $counter_b)
			$message_t:=Replace string:C233($message_t; "${counter}"; String:C10($value_o.counter))
		End if 
		
		// replacing ${end}
		If ((Position:C15("${end}"; $message_t)>0) && $end_b)
			$message_t:=Replace string:C233($message_t; "${end}"; String:C10($value_o.end))
		End if 
		
		// calculating and replacing ${timeRemaining}
		If ((Position:C15("${timeRemaining}"; $message_t)>0) && $counter_b && $end_b)
			
			$counter_r:=$value_o.counter
			$end_r:=$value_o.end
			
			If (This:C1470._startTime=Null:C1517)
				This:C1470._startTime:=Milliseconds:C459
			End if 
			
			If (This:C1470._progress=0)
				$timeRemaining_t:=""
			Else 
				$initialCounterRange_r:=Round:C94($end_r*0.05; 2)
				$elapsed_r:=Milliseconds:C459-This:C1470._startTime
				$toProcessMilliSec_r:=Int:C8($elapsed_r*(1-This:C1470._progress)/This:C1470._progress)
				$toProcessSec_l:=$toProcessMilliSec_r\1000
				$days_l:=$toProcessSec_l\(60*60*24)
				If ($days_l=0)
					$timeRemaining_t:=String:C10(Time:C179($toProcessSec_l); HH MM SS:K7:1)
				Else 
					$toProcessSec_l:=$toProcessSec_l%(60*60*24)
					$timeRemaining_t:=String:C10($days_l)+":"+String:C10(Time:C179($toProcessSec_l); HH MM SS:K7:1)
				End if 
				
			End if 
			$message_t:=Replace string:C233($message_t; "${timeRemaining}"; $timeRemaining_t)
			
			If ($counter_r=$end_r)
				OB REMOVE:C1226(This:C1470; "_startTime")
			End if 
			
		End if 
		
		This:C1470.message:=$message_t
		
	End if 
	
Function start()
	
	var $name_t : Text
	var $id_l : Integer
	var $progressWindow_o : cs:C1710.ProgressWindow
	
	$name_t:=This:C1470._name
	$progressWindow_o:=cs:C1710.ProgressWindow.me
	If ($progressWindow_o._has($name_t))
		return 
	End if 
	
	$id_l:=Progress New
	$progressWindow_o._add($name_t; $id_l)
	
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
	
Function stop()
	
	var $name_t : Text
	var $id_l : Integer
	var $progressWindow_o : cs:C1710.ProgressWindow
	
	$name_t:=This:C1470._name
	$progressWindow_o:=cs:C1710.ProgressWindow.me
	If ($progressWindow_o._has($name_t)=False:C215)
		return 
	End if 
	
	$id_l:=$progressWindow_o._getId($name_t)
	Progress QUIT($id_l)
	$progressWindow_o._remove($name_t)
	