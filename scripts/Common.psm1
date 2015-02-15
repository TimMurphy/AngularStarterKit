function Confirm(
    [parameter(Mandatory = $true)]
    [ValidateNotNullOrEmpty()]
    [string] $title,

    [parameter(Mandatory = $true)]
    [ValidateNotNullOrEmpty()]
    [string] $message)
{
    $yes = New-Object System.Management.Automation.Host.ChoiceDescription "&Yes"
    $no = New-Object System.Management.Automation.Host.ChoiceDescription "&No"

    $options = [System.Management.Automation.Host.ChoiceDescription[]]($yes, $no)

    $result = $host.ui.PromptForChoice($title, $message, $options, 0) 

    return $result -eq 0
}

function Execute(
    [Parameter(Mandatory=$true)] [scriptblock] $cmd,
    [string] $errorMessage = ("Error executing command {0}." -f $cmd),
    [int] $maxRetries = 0)
{
    $tryCount = 1

    do 
    {
        try
        {
            $LASTEXITCODE = 0

            & $cmd

            if ($LASTEXITCODE -ne 0) 
            {
                throw ("Exec: " + $errorMessage)
            }
            break
        }
        catch [Exception]
        {
            if ($tryCount -gt $maxRetries)
            {
                throw $_
            }

            Write-Host "Try $tryCount failed, retrying again in 1 second..."

            $tryCount++

            [System.Threading.Thread]::Sleep([System.TimeSpan]::FromSeconds(1))
        }
    }
    while ($true)
}

function Join-PathEnvironment(
    [parameter(Mandatory = $true)]
    [ValidateNotNullOrEmpty()]
    [string] $addToPath)
{
    $newPath = $env:Path
    
    if (-not $newPath.EndsWith(";"))
    {
        $newPath += ";"
    }
    
    if ($newPath.Contains($addToPath + ";"))
    {
        return $newPath
    }
    
    return $newPath + $addToPath + ";"
}

function Set-MachineEnvironmentVariable(
    [parameter(Mandatory = $true)]
    [ValidateNotNullOrEmpty()]
    [string] $variable,

    [parameter(Mandatory = $true)]
    [ValidateNotNullOrEmpty()]
    [string] $value)
{
    [Environment]::SetEnvironmentVariable($variable, $value, [System.EnvironmentVariableTarget]::Machine)
}

function Test-Admin {

    $currentUser = New-Object Security.Principal.WindowsPrincipal $([Security.Principal.WindowsIdentity]::GetCurrent())

    return $currentUser.IsInRole([Security.Principal.WindowsBuiltinRole]::Administrator)
}
