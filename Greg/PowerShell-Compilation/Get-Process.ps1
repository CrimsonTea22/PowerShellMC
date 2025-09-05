# Get-Process

#CONTENT
<#
CONTENTS:

1. Link
2. Description
3. EXAMPLES
3.1. Example 1: Get a list of all running processes on the computer
3.2. Example 2: Display detailed information about one or more processes
3.3. Example 3: Get all processes with a working set greater than a specified size
3.4. Example 4: Display processes on the computer in groups based on priority

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


#Example 3: Get all processes with a working set greater than a specified size

# Where-Object

Get-Process | Where-Object { $_.WorkingSet -gt 20917520 }

Get-Process | Where-Object WorkingSet -gt 20MB


<#
The Get-Process cmdlet returns the running processes.

In the context of PowerShell and Windows,
the "working set" of a process refers to the set of memory pages
that are currently resident in physical RAM and are actively being used by that process.



The Get-Process cmdlet returns the running processes.

The output is piped to the Where-Object cmdlet,
which selects the objects with a WorkingSet value greater than 20,971,520 bytes.

In the first example,
Where-Object uses a scriptblock to compare the WorkingSet property of each Process object.


In the second example,
the Where-Object cmdlet uses the simplified syntax to compare the WorkingSet property.

In this case, -GT is a parameter, not a comparison operator.

The second example also uses a numeric literal suffix as a concise alternative to 20971520.

In PowerShell, MB represents a mebibyte (MiB) multiplier.

20MB is equal to 20,971,520 bytes.


#>
#end


#Example 4: Display processes on the computer in groups based on priority

$processes = Get-Process
$processes | Sort-Object { $_.PriorityClass } | Format-Table -View Priority

Get-Process | Sort-Object { $_.PriorityClass } | Format-Table -View Priority

<#

These commands display processes on the computer in groups based on their priority class.

The first command gets all processes on the computer and stores them in the $processes variable.

The second command pipes the Process objects stored in the $processes variable to the Sort-Object cmdlet,
then to the Format-Table cmdlet,
which formats the processes using the Priority view.


In essence:
Priority Class: sets the overall "importance" of a process.
Priority (Thread Priority): determines the relative importance of individual tasks within that process.

#>
#end


# Example 5: Add a property to the default `Get-Process` output display

Get-Process -Name pwsh | Format-Table -Property @(
    @{ Name = 'NPM(K)'; Expression = { [int] ($_.NPM / 1KB) } }
    @{ Name = 'PM(M)';  Expression = { [int] ($_.PM / 1MB) } }
    @{ Name = 'WS(M)';  Expression = { [int] ($_.WS / 1MB) } }
    @{ Name = 'CPU(s)'; Expression = { if ($_.CPU) { $_.CPU.ToString('N') } } }
    'Id'
    @{ Name = 'SI'; Expression = 'SessionId' }
    'ProcessName'
    'StartTime'
) -AutoSize


<#

This example retrieves processes from the local computer;
and pipes each Process object to the Format-Table cmdlet.

Format-Table recreates the default output display of a Process object
using a mixture of property names and calculated properties.

The display includes an additional StartTime property not present
in the default display.


SAMPLE of Try-Catch
try {
    Get-Process -Name pwsh | Format-Table -Property @(-!!
    @{ Name = 'NPM(K)'; Expression = { [int] ($_.NPM / 1KB) } } ) asdfadfadf #garbage
}
catch {
    Write-Output -ForegroundColor Yellow -BackgroundColor Black "Terminating Error/Exception Happens - $($Error.Exception.Message)"
}

#>
#end


# Example 6: Get version information for a process

Get-Process -Name pwsh -FileVersionInfo

<#

This command uses the FileVersionInfo parameter
to get file version information for the main module of the pwsh process.

The main module is the file used to start the process,
which in this case is pwsh.exe.

To use this command with processes that you don't own
on Windows Vista and later versions of Windows,
you must run PowerShell with elevated user rights (Run as administrator).


#>
#end
#end


# Example 7: Get modules loaded with the specified process

Get-Process -Name SQL* -Module

<#

This command uses the Module parameter
to get the modules loaded by all processes
with a name beginning with SQL.

To use this command with processes
that you don't own on Windows Vista and later versions of Windows,
you must run PowerShell with elevated user rights (Run as administrator).

#>
#end


# Example 8: Find the owner of a process

Get-Process -Name pwsh -IncludeUserName

# Complex Way

Get-CimInstance -ClassName Win32_Process -Filter "name='pwsh.exe'" |
    Invoke-CimMethod -MethodName GetOwner


<#
The first command shows how to get the owner of a process.
The output reveals that the owner is DOMAIN01\user01.



The second pipeline shows a different way
to get the owner of a process using Get-CimInstance
and Invoke-CimMethod.

The Win32_Process class with a filter retrieves pwsh processes
and the invoked GetOwner() method returns information
on the process's Domain and User.

This method is only available on Windows
and doesn't require elevated user rights.

#>
#end


# Example 9: Use an automativ variable to identify the process hosting the current section

Get-Process -Name pwsh

Get-Process -Id $PID

<#

These commands show how to use the $PID automatic variable
to identify the process that's hosting the current PowerShell session.

You can use this method to distinguish the host process
from other pwsh processes that you might want to control.

The first command gets all pwsh processes running.
The second command gets the pwsh process that's hosting the current session.

#>
#end


# Example 10: Get all processes that have a main window title and display them in a table

Get-Process |
    Where-Object -Property MainWindowTitle |
    Format-Table -Property Id, Name, MainWindowTitle -AutoSize


<#
This pipeline gets all processes that have a main window title,
and displays them in a table with the process ID and name.

MainWindowTitle is one of many useful properties of the Diagnostics.

Process object type that Get-Process returns.

To view all properties, use Get-Process | Get-Member.
#>
#end
