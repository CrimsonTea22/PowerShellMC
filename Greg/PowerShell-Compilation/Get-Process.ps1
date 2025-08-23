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
