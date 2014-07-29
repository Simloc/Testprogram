# run with: powershell -ExecutionPolicy RemoteSigned -file sleep.ps1
# run with: powershell -file sleep.ps1
# run with: powershell .\sleep.ps1

$ErrorActionPreference = "Stop"

function main()
{
    write-host "Do you want to use " -n
    write-host "seconds" -f Green -n
    write-host " or " -n
    write-host "minutes" -f Green -n
    write-host " (specify s or m)?"
    $choice = read-host
     
    if ($choice.ToLower().StartsWith("s"))
    {
        WaitSeconds
    }
    elseif ($choice.ToLower().StartsWith("m"))
    {
        WaitMinutes
    }
    else
    {
        write-host "Invalid choice: minuter/sekunder. Please try again." -f Red
    }

}

function WaitSeconds()
{
    write-host "Please specify number of seconds: " -n

    try
    {
      [int] $delay = read-host
    }
    catch
    {
      write-host "ERROR: Invalid number of seconds specified!" -f Red
      return
    }

    for ([int] $loop=0; $loop -lt $delay; $loop++)
    {
      [string] $progress = "" + $loop + "   " + (get-date).ToString("yyyy-MM-dd HH-mm-ss") + "`r"
      write-host $progress -n

      start-sleep -seconds 1
    }

    write-host ""

    $sound = New-Object System.Media.SoundPlayer
    $sound.SoundLocation="c:\WINDOWS\Media\notify.wav"
    $sound.PlaySync()

}


function WaitMinutes()
{
    write-host "Please specify number of minutes: " -n
    try
    {
      [int] $delay = read-host
    }
    catch
    {
      write-host "ERROR: Invalid number of seconds specified!" -f Red
      return
    }

    for ([int] $loop=0; $loop -lt ($delay * 60); $loop++)
    {
      [string] $progress = "" + $loop + "   " + (get-date).ToString("yyyy-MM-dd HH-mm-ss") + "`r"
      write-host $progress -n

      start-sleep -seconds 1
    }

    write-host ""

    $sound = New-Object System.Media.SoundPlayer
    $sound.SoundLocation="c:\WINDOWS\Media\notify.wav"
    $sound.PlaySync()

}

main
