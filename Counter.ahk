;Enter your TXT file path .
filePath := A_WorkingDir . "\counter.txt"

IfNotExist, %filePath%
	FileAppend,0, %filePath%

FileReadLine, deathVar, %filePath%, 1


;When you press F12 it will increment and update the death counter in the .txt
	F12::
		FileReadLine, deathVar, %filePath%, 1
		Var := ++deathVar
		FileDelete, %filePath%
		FileAppend,%deathVar%, %filePath%
	return

;When you press F11 it will decrement and update the death counter in the .txt
	F11::
		FileReadLine, deathVar, %filePath%, 1
		if deathVar = 0
		return
		Var := --deathVar
		FileDelete, %filePath%
		FileAppend,%deathVar%, %filePath%
	return