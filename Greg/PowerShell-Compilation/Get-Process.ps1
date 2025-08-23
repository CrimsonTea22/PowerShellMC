# Get-Process

#CONTENT
<#
CONTENTS:

1. Link
2. Description
3. EXAMPLES
3.1. Example 1: Get a list of all running processes on the computer


#>
#End


#LINK
<#

LINK:
https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.management/get-process?view=powershell-7.5

#>
#end

#Description

<#

Get-Process cmdlet

    - gets the processes on a local computer.

Without parameters, this cmdlet gets all processes on the local computer.

You can also specify a specific process by process name or process ID (PID),
or by piping a System.Diagnostics.Process object to this cmdlet.

By default, this cmdlet returns a Process object that has detailed information about the process and supports methods that let you control it.
With parameters, you can change the type of information returned by this cmdlet.

Module: Retrieve information for each module loaded into the process.
FileVersionInfo: Retrieve file version information for the main module of the process.

#>
#end


#EXAMPLES

#Example 1: Get a list of all running processes on the computer


# This command gets a list of all running processes on the local computer

Get-Process

# To see all properties of a Process object

Get-Process | Get-Member

<#

By default, PowerShell displays certain property values using units such as kilobytes (K) and megabytes (M).

The actual values when accessed with the member-access operator (.) are in bytes.

#>
#end

#Example 2: Display detailed information about one or more processes

# One Process

Get-Process explorer
Get-Process winlogon

# Two or more processes

Get-Process explorer, winlogon

# With Format-List

Get-Process explorer | Format-List *
Get-Process explorer, winlogon | Format-List *

<#

This pipeline displays detailed information about the winword and explorer processes on the computer.

It uses the Name parameter to specify the processes, but it omits the optional parameter name.

The pipeline operator (|) pipes Process objects to the Format-List cmdlet,
which displays all available properties (*) and their values for each object.

#>

# With ID

Get-Process -ID 664

Get-Process -ID 664, 2060
#end
