/*
 * Name 		: Search & Update for AutoHotkey
 * Version 		: 0.1
 * Updated 		: 7 January 2013
 * Author 		: @seangravener
 */

#Include lib\tf.ahk

; @todo: move config to config text file that does not get compiled
; ConfigPath = . ; no trailing slash
; CreateBackup = true
FileLocation = C:\Windows\System32\drivers\etc\hosts.test
SearchString = local.pplelectric.com
IP = %A_IPAddress1%

/* 
GetConfig(ConfigPath)
{
	ConfigFile = %ConfigPath%\config.txt
} 

WriteLog(LogPath)
{
	; @todo
} 
*/

GetLineNum(FileLocation, SearchString)
{
	Loop, read, %FileLocation%
	{
	    IfInString, A_LoopReadLine, %SearchString%
	    {
			LineNumber = %A_Index%
			Return %LineNumber%
	    }
	}
}

IfExist, %FileLocation%
	LineNumber := GetLineNum(FileLocation, SearchString)

FormatTime, TimeString ; eg. 5:08 PM Friday, January 04, 2013
LineText = %IP% 	%SearchString%	 	# auto-updated %TimeString%

if (LineNumber > 0)
	TF_ReplaceLine("!" . FileLocation, LineNumber, LineNumber, LineText)
