SET modulespath="%homedrive%%homepath%\Documents\WindowsPowerShell\Modules\Get-Object"
rd /s /q %modulespath%
md %modulespath%
copy *.ps?1 %modulespath%
pause