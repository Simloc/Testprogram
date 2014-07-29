# run with: powershell -ExecutionPolicy RemoteSigned -file GetWindowsUptime.ps1
# run with: powershell -file GetWindowsUptime.ps1
# run with: powershell .\GetWindowsUptime.ps1

$ErrorActionPreference = "Stop"

function main()
{
    [string] $CSharpProgram = '
    public class GetTickCountClass
    {
      [System.Runtime.InteropServices.DllImport("kernel32.dll")]
      public static extern long GetTickCount();

      public static long GetTickCountFunction()
      {
        return GetTickCount();
      }
    }'

    Add-Type $CSharpProgram

    [long] $MillisecondsSinceWindowsStarted = [GetTickCountClass]::GetTickCountFunction()

    [TimeSpan] $timespan = [TimeSpan]::FromMilliseconds($MillisecondsSinceWindowsStarted)

    Write-Host ("Time since windows started: " + $timespan)
}

main
