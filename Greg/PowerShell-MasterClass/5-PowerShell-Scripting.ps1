#Write-Output

Write-Output "Hello, Universe"

Write-Output ("Hello " + $env:COMPUTERNAME)
#end


#Write-Output VS Write-Host
function receive-output
{
    process {Write-Host $_ -ForegroundColor Green}
}
#end


# 7. Differences Between ' and "

<#

Difference between ' and "

• The difference is minimal

• Generally use single quotes

• Variables in double quotes are replaced with their values but not in single quotes

• Double quotes enable delimiting within a string

• Can use escape characters with double quotes

#>


$name = "Greg"
Write-Output "Hello $name"
Write-Output 'Hello $name'

$query = "SELECT * FROM OS WHERE Name LIKE '%SERVER%'"
Write-Output "Hello 't't't World"
#end


# 8. Prompting The User
<#
Prompting the User

• Read-Host is an easy way to get input.

• Possible to add -AsSecureString to avoid displaying to screen and storing securely

$name = Read-Host "Who are you?"
$pass = Read-Host "What's your password?" -AsSecureString
[Runtime.InteropServices.Marshal]::PtrToStringAuto([Runtime.InteropServices.Marshal)]::SecureStringToBSTR($pass))

NOTE: Try to avoid using Read-Host; it makes it interactive.

We would not be out to run this script in an unattended fashion.
We couldn't schedule things.
We coudln't run it from a run book engine.

#>
#end


#Prompting User To Ask For Credentials

$name = Read-Host "Who are you?"
$pass = Read-Host "What's your password?" -AsSecureString
[Runtime.InteropServices.Marshal]::PtrToStringAuto([Runtime.InteropServices.Marshal]::SecureStringToBSTR($pass))

#NOTE: These commands will provide the value of the Secure Strings.
#end


# 9. First Script With Input

<#

• First Script With Input

Param{
[string]$computername='savazussdc01' '
Get-WmiObject -class win32_Computersytem '
    -ComputerName $computername |
    fl numberofprocessors,totalphsyicsalmemory
}


` - this allows us to carry on the command to the next line.

NOTE: Formatting is essential; the way the code works with readablity and saving space.

#>
#end

#Get-WMIObject

Param(
[string]$computername='savazuusscdc01')
Get-WmiObject -class win32_computersystem `
	-ComputerName $computername |
	fl numberofprocessors,totalphysicalmemory
#end
#end


# 10. Script With Mandatory Input

<#
Script With Mandatory Input

• Id a user does not type in the parameter, they will be prompted for it!

• No Special Code needed.


# This is by having a default.

Param(
[string]$computername='savazuusscdc01')
Get-CimInstance -ClassName win32_computersystem `
	-ComputerName $computername |
	fl numberofprocessors,totalphysicalmemory

#end

#This is by setting a mandatory input

Param(
[Parameter(Mandatory=$true)][string]$computername)
Get-CimInstance -ClassName win32_computersystem `
	-ComputerName $computername |
	fl numberofprocessors,totalphysicalmemory

#end

• Script With Multiple Input

Param(
[Parameter(Mandatory=$true)][string[]]$computername)
foreach ($computername in $computers)
{
Get-CimInstance -ClassName Win32_ComputerSystem `
    -ComputerName $computername |
	fl numberofprocessors,totalphysicalmemory
}

NOTE: A simple string has turned into an array. We could input multiple computers.

NOTE: foreach. we are going to iterate things here - each object in turn.

#>
#end

#Get-CimInstance

Param(
[Parameter(Mandatory=$true)][string]$computername
)
Get-CimInstance -ClassName Win32_ComputerSystem `
    -ComputerName $computername |
	fl numberofprocessors,totalphysicalmemory


Param(
[Parameter(Mandatory=$true)][string[]]$computername)
foreach ($computername in $computers)
{
Get-CimInstance -ClassName Win32_ComputerSystem `
    -ComputerName $computername |
	fl numberofprocessors,totalphysicalmemory
}



# 11. Sript With Different Output

<#

Param(
[Parameter(Mandatory=$true)][string[]]$computers)
foreach ($computername in $computers)
{
    $win32CSOut = Get-CimInstance -ClassName win32_computersystem -ComputerName $computername
    $win32OSOut = Get-CimInstance -ClassName win32_operatingsystem -ComputerName $computername

    $paramout = @{'ComputerName'=$computername;
    'Memory'=$win32CSOut.totalphysicalmemory;
    'Free Memory'=$win32OSOut.freephysicalmemory;
    'Procs'=$win32CSOut.numberofprocessors;
    'Version'=$win32OSOut.version}

    $outobj = New-Object -TypeName PSObject -Property $paramout
    Write-Output $outobj
}

NOTE: A simple string has turned into an array. We could input multiple computers.

NOTE: foreach. we are going to iterate things here - each object in turn.

Then run the buffer code below of these.

NOTE: We are creating hash table - property names and values

	$paramout = @{'ComputerName'=$computername;
    'Memory'=$win32CSOut.totalphysicalmemory;
    'Free Memory'=$win32OSOut.freephysicalmemory;
    'Procs'=$win32CSOut.numberofprocessors;
    'Version'=$win32OSOut.version}

NOTE: We are storing the hashtable created as a Custom Object.

	$outobj = New-Object -TypeName PSObject -Property $paramout
    Write-Output $outobj


NOTE: Repeat this part...!!!

#>
#end

# Sript With Different Output

Param(
[Parameter(Mandatory=$true)][string[]]$computers)
foreach ($computername in $computers)
{
    $win32CSOut = Get-CimInstance -ClassName win32_computersystem -ComputerName $computername
    $win32OSOut = Get-CimInstance -ClassName win32_operatingsystem -ComputerNawme $computername

    $paramout = @{'ComputerName'=$computername;
    'Memory'=$win32CSOut.totalphysicalmemory;
    'Free Memory'=$win32OSOut.freephysicalmemory;
    'Procs'=$win32CSOut.numberofprocessors;
    'Version'=$win32OSOut.version}

    $outobj = New-Object -TypeName PSObject -Property $paramout
    Write-Output $outobj
}
#end