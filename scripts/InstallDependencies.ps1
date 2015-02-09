Write-Host
Write-Host Installs dependencies to build and run Angular Starter Kit.
Write-Host
Write-Host This script assumes chocolatey.org is installed.
Write-Host

$ErrorActionPreference = "Stop"

Import-Module $PSScriptRoot\Common.psm1 -Force

if (-not (Test-Admin))
{
    throw "InstallDependencies.ps1 must be run as administrator."
}

if (-not (Confirm -title "Install Dependencies" -Message "Install Angular Starter Kit dependencies?"))
{
    return
}

Execute { &choco install nodejs }
Execute { &choco install npm }