$str = .\msiinv\msiinv.exe -s | Select-String "SQL Server" -Context 1,1;
$str = $str -replace "Product code:	","msiexec /x """;
$str = $str -replace ">", "rem";
$str = $str -replace "\t", "";
$str = $str -replace "}","}"" /quiet";
$str | Out-File elevated.bat -encoding ascii;

Start-Process .\elevated.bat -Verb runas -Wait
rm .\elevated.bat