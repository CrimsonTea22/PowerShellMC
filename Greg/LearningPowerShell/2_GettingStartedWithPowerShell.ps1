

# https://learn.microsoft.com/en-us/powershell/scripting/learn/ps101/01-getting-started?view=powershell-7.5

# Chapter 1 - Getting started with PowerShell

<#

This chapter focuses on finding and launching PowerShell;
and solving the initial pain points that new users experience with PowerShell.

Follow along and walk through the examples in this chapter on your lab environment computer.

#>

# What is PoweShell

<#

Windows PowerShell is an easy-to-use command-line shell and scripting environment
for automating administrative tasks of Windows-based systems.

Windows PowerShell is preinstalled on all modern versions of the Windows operating system.

#>




# Where to find PowerShell

<#

The easiest way to find PowerShell on Windows 11
is to type PowerShell into the search bar, as shown in Figure 1-1.

Notice that there are four different shortcuts for Windows PowerShell.

#>



# Windows PowerShell shortcuts on a 64-bit version of Windows:

<#

    Windows PowerShell
    Windows PowerShell ISE
    Windows PowerShell (x86)
    Windows PowerShell ISE (x86)

On a 64-bit version of Windows,
you have a 64-bit version of the Windows PowerShell console
and the Windows PowerShell Integrated Scripting Environment (ISE)

and a 32-bit version of each one,
as indicated by the (x86) suffix on the shortcuts.


NOTE:

    Windows 11 only ships as a 64-bit operating system.
    There is no 32-bit version of Windows 11.
    However, Windows 11 includes 32-bit versions of Windows PowerShell and the Windows PowerShell ISE.


You only have two shortcuts if you're running an older 32-bit version of Windows.
Those shortcuts don't have the (x86) suffix but are 32-bit versions.

I recommend using the 64-bit version of Windows PowerShell if you're running a 64-bit operating system
unless you have a specific reason for using the 32-bit version.


Depending on what version of Windows 11 you're running, Windows PowerShell might open in Windows Terminal.


Microsoft no longer updates the PowerShell ISE.
The ISE only works with Windows PowerShell 5.1.

Visual Studio Code (VS Code) with the PowerShell extension works with both versions of PowerShell.
VS Code and the PowerShell extension don't ship in Windows.
Install VS Code and the extension on the computer where you create PowerShell scripts.

You don't need to install them on all the computers where you run PowerShell.

#>









# How to launch PowerShell

<# ... #>












# Determine your version of PowerShell

$PSVersionTable

<#

There are automatic variables in PowerShell that store state information.

One of these variables is $PSVersionTable, which contains version information about your PowerShell session.

#>
