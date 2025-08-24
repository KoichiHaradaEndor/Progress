//%attributes = {}
var $dialog1_o; $dialog2_o : cs:C1710.ProgressDialog
var $window_o : cs:C1710.ProgressWindow

$dialog1_o:=cs:C1710.ProgressDialog.new("test1")
$dialog1_o.start()

$window_o:=cs:C1710.ProgressWindow.me
$window_o.hide()
$dialog1_o.stop()

$dialog2_o:=cs:C1710.ProgressDialog.new("test2")
$dialog2_o.start()

$window_o.show()

$dialog2_o.stop()
