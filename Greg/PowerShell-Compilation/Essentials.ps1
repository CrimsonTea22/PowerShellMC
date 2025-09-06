
#Essentials

# Open Calculator

Start-Process calc.exe

# Open Network Adapters

Start-Process control netconnections

# Open Storage Sense

Start-Process 'ms-settings:storagesense'

# Windows Services

services.msc




#Practice Scripts

# $args

Write-Host "Length of the argument:" ($args.length)
Write-Output "Here's your greeting:"
foreach ($arg in $args){
    Write-Output $arg
}

<#
To execute: .\args Hello Saturn
#>
