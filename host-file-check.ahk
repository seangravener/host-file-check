#Include lib\tf.ahk

HostsFileLocation = C:\Windows\System32\drivers\etc\hosts.test
SearchString = local.pplelectric.com

ConfigFile = config
GetConfig()
{

}

ReadHostsFile(HostsFileLocation, SearchString)
{
	Loop, read, %HostsFileLocation%
	{
	    IfInString, A_LoopReadLine, %SearchString%
	    {
			LineNumber = %A_Index%
			Return %LineNumber%
	    }
	}
}

FormatTime, TimeString ; eg. 5:08 PM Friday, January 04, 2013
LineNumber := ReadHostsFile(HostsFileLocation, SearchString)
LineText = %IP% 	local.pplelectric.com 	# auto-updated %TimeString%

TF_ReplaceLine("!" . HostsFileLocation, LineNumber, LineNumber, LineText)