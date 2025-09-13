//%attributes = {}
var $progress_o : cs:C1710.ProgressDialog
var $options_o : Object
var $options_t : Text

$options_o:={\
buttonEnabled: True:C214; \
buttonTitle: "停止"; \
title: "Test Options"; \
message: "Preparing..."; \
progress: -1; \
stopEventListener: ""\
}

$progress_o:=cs:C1710.ProgressDialog.new("test"; $options_o)

$options_t:="buttonEnabled: "+String:C10($progress_o.buttonEnabled)+"\n"
$options_t+="buttonTitle: "+$progress_o.buttonTitle+"\n"
$options_t+="title: "+$progress_o.title+"\n"
$options_t+="message: "+$progress_o.message+"\n"
$options_t+="progress: "+String:C10($progress_o.progress)+"\n"
ALERT:C41($options_t)

$progress_o.start()

$options_t:="buttonEnabled: "+String:C10($progress_o.buttonEnabled)+"\n"
$options_t+="buttonTitle: "+$progress_o.buttonTitle+"\n"
$options_t+="title: "+$progress_o.title+"\n"
$options_t+="message: "+$progress_o.message+"\n"
$options_t+="progress: "+String:C10($progress_o.progress)+"\n"
ALERT:C41($options_t)

$progress_o.stop()
