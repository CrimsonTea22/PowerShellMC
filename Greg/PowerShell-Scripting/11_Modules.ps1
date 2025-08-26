

# MODULES

<#

Contents:

1. Intro
2. Environement Variable
3. Get Modules
4. Remove Modules
5. Install MOdules
6. PowerShell Gallery
7. Uinstalling Modules

#>


# 1. Intro



# 2 Environement Variable

# to get a list of directories that our modules can be installed in
# where we can easily go fetch them from

$env:PSModulePath

# for a better view

$($env:PSModulePath).split(';')
#end


# 3. Get-Module; Import-Module

# To obtain the modules loaded in your session

Get-Module

# To list all the powershell modules that are currently isntalled.

Get-Module -ListAvailable

# Importing a module

Import-Module ScheduledTasks

# To verify.

Get-Module #NOTE: Module is now loaded in the session.

# How to use a module? Get-Command.

Get-Command -Module ScheduledTasks

# Getting the scheduled task. Module: ScheduledTask

Get-ScheduledTask

# Reimporting the module; Updating the function changes in the module.
# E.g. Module is installed from the interenet, some updates are done to it.
# then you re-import it, if it already exist as a loaded session.

Import-Module -Name ScheduledTask -Force

#end



# 4. Remove-Module

# Removing a module

Remove-Module ScheduledTask

# To verify

Get-Module # no longer loaded in the session

# You can create your custom module.
# This is where Remove-Module comes in handy.
#end




# 5. Installing Modules

<#
Three  ways to get modules online.

    1. Find-Module
    2. www.powershellgallery.com
    3. GitHub

#>

# Find-Module

Find-Module -Name AzureAD

<#
Output:

PS C:\PowerShellMC> Find-Module -Name AzureAD

Version              Name                                Repository
-------              ----                                ----------
2.0.2.182            AzureAD                             PSGallery
#>


# Install-Module

Install-Module -Name AzureAD

Install-Module # this works correctly.

# To verify

Get-Module
#end



# 6. Unisntall Module

# Uninstall-Module

Uninstall-Module -Name AzureAD
Uninstall-Module AzureAD

# If the module is in-use, perform Remove-Module first.
# Elevate user privileges.

Remove-Module -Name AzureAD
#end



# 7. PowerShell Gallery And GitHub

# www.powershellgallery.com

<#

Key Things To Do:

1. Search for a module
2. Read Description
3. See Installation OPtions
4. See FileList

Other things to do:

1. On the main pae, see PSWindowsUpdate Module

PSWindowsUpdate

    It allows you to manage the Windows Update thorugh PowerShall

There are good derisired state configuration module in powershellgallery.com


3. GitHub Too.

    Download and copy to module paths.
    Then, Import-Module.

NOTE: There's a bunch of modules - e.g.,VMWare module, CISCO, ARUBA
Instead writing commands to APIs and writing your own module;
ALways check first if something already exist.

#>
