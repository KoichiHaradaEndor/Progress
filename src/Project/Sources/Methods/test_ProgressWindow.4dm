//%attributes = {}
var $progressWindow_o : cs:C1710.ProgressWindow
var $progressDialog_o : cs:C1710.ProgressDialog

var $funcOnError_t : Text
var $appearance_o : Object
var $pid_l : Integer

$pid_l:=Current process:C322

$progressWindow_o:=cs:C1710.ProgressWindow.me
$progressDialog_o:=cs:C1710.ProgressDialog.new("test-hide-show")
$progressDialog_o.start()
$progressDialog_o.title:="Test"

//MARK: errorEventListenerのテスト
$progressDialog_o.message:="Testing errorEventListener attribute"
$progressWindow_o.errorEventListener:="funcOnError"
$funcOnError_t:=$progressWindow_o.errorEventListener
DELAY PROCESS:C323($pid_l; 120)
ASSERT:C1129($funcOnError_t="funcOnError"; "Error on errorEventListener")

//MARK: hide() と show() のテスト
// 進捗ウィンドウを2秒隠す
$progressDialog_o.message:="Hiding progress window"
$progressWindow_o.hide()
DELAY PROCESS:C323($pid_l; 120)
$progressDialog_o.message:="Showing progress window"
$progressWindow_o.show()
DELAY PROCESS:C323($pid_l; 120)

//MARK: setCoordinates() のテスト
$progressDialog_o.message:="Going to move this window"
DELAY PROCESS:C323($pid_l; 120)
$progressWindow_o.move(50; 150)
$progressDialog_o.message:="Moved the window"
DELAY PROCESS:C323($pid_l; 120)

//MARK: setGlobalAppearance() のテスト
$progressDialog_o.message:="Change title appearance"
$appearance_o:={title: {fontSize: 16; fontName: "Arial"}}
$progressWindow_o.fonts($appearance_o)
DELAY PROCESS:C323($pid_l; 120)

$progressDialog_o.message:="Change message appearance"
$appearance_o:={message: {fontSize: 16; fontName: "Arial"}}
$progressWindow_o.fonts($appearance_o)
DELAY PROCESS:C323($pid_l; 120)

$progressDialog_o.message:="Change button appearance"
$appearance_o:={button: {fontSize: 16; fontName: "Arial"}}
$progressWindow_o.fonts($appearance_o)
DELAY PROCESS:C323($pid_l; 120)

$progressDialog_o.stop()

ALERT:C41("Done")

/**
* テスト結果
* errorEventListener: OK
* hide show: OK
* move: OK
* setGlobalAppearance: OK
*/