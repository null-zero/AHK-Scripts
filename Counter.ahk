;Enter your TXT file path .
filePath := A_WorkingDir . "\counter.txt"

IfNotExist, %filePath%
	FileAppend,0, %filePath%

FileReadLine, countVar, %filePath%, 1


;When you press F12 it will increment and update the counter in the .txt
	F12::
		FileReadLine, countVar, %filePath%, 1
		Var := ++countVar
		FileDelete, %filePath%
		FileAppend,%countVar%, %filePath%
	return

;When you press F11 it will decrement and update the counter in the .txt, wont count below 0, remove the if return if needed
	F11::
		FileReadLine, countVar, %filePath%, 1
		if countVar = 0
		return
		Var := --countVar
		FileDelete, %filePath%
		FileAppend,%countVar%, %filePath%
	return
