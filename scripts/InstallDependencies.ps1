function Main()
{
    Write-Host
    Write-Host Installs dependencies to build and run Angular Starter Kit.
    Write-Host
    Write-Host This script assumes chocolatey.org is installed.
    Write-Host

    if (-not (Test-Admin))
    {
        throw "InstallDependencies.ps1 must be run as administrator."
    }

    if (-not (Confirm -title "Install Dependencies" -Message "Install Angular Starter Kit dependencies?"))
    {
        return
    }
    
    Install-ChocolateyPackages
    Install-NodePackages
    Add-NodeToolsToMachinePath
}

function Install-ChocolateyPackages()
{
    Execute { &choco install nodejs }
    Execute { &choco install npm }
}

function Install-NodePackages()
{
    Execute { &npm install gulp --global }
}

function Add-NodeToolsToMachinePath()
{
    $npmPrefix = &npm config get prefix
    
    if ($LASTEXITCODE -ne 0)
    {
        throw "'npm config get prefix' failed: $LASTEXITCODE."
    }
    
    $newPath = Join-PathEnvironment $npmPrefix
    Set-MachineEnvironmentVariable Path $newPath
}

$ErrorActionPreference = "Stop"

Import-Module $PSScriptRoot\Common.psm1 -Force

Main