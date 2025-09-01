Write-Host "Length of the argument:" ($args.length)
Write-Output "Here's your greeting:"
foreach ($arg in $args){
    Write-Output $arg
}
