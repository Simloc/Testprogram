# run with: powershell -ExecutionPolicy RemoteSigned -file calc.ps1
# run with: powershell -file calc.ps1
# run with: powershell .\calc.ps1

function main()
{  
    write-host "enter the first value:"
    [int] $value1 = read-host

    write-host "enter the second value:"
    [int] $value2 = read-host

    write-host "specify arithmetic:"
    [string] $operation = read-host

    if ($operation.ToLower().StartsWith("a"))
    {
        [float] $result = $value1 + $value2
    }
    elseif ($operation.ToLower().StartsWith("s"))
    {
        [float] $result = $value1 - $value2
    }
    elseif ($operation.ToLower().StartsWith("m"))
    {
        [float] $result = $value1 * $value2
    }
    elseif ($operation.ToLower().StartsWith("d"))
    {
        [float] $result = $value1 / $value2
    }
    else
    {
        write-host "Invalid opeartion: a/s/m/d. Please try again." -f Red
        return
    }


    write-host ("Resultat: " + $result)
    
}

main
