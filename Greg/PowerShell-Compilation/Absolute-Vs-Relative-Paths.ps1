#Absolute and Relative Paths

<#
Contents:

1. Description
2. Example 1: User Default Path
3. Example 2: Changing Directories
4. Example 3: Changing Directories with Special Characters in Path; Absolute and Relative Path
5. Example 4: Using Set-Location for a PowerShell Script

#>


#Description

<#

Set-Location is used to change directory or folder.

#>
#end













#Example 1: User Default Path

# User Default Path

Set-Location

<#

Wherever path you're in, by issuing the command above, it'll switch you the user default path.

#>
#End






#Example 2: Changing Directories

# To change directory

Set-Location C:\Users\Greg\Desktop\


# To change to a specific directory within a directory

Set-Location .\Documents\

#

# Moves up one Directory

Set-Location ..


# Alias of Set-Location

Get-Alias cd

# NOTE: Alias cd -> Set-Location
#end





#Example 3: Changing Directories with Special Characters in Path; Absolute and Relative Path

# Stays in the current directory

Set-Location .

# Moves up one directory

Set-Location ..

# Goes up two directories

Set-Location ..\..



<#

Special Characters in Path

.  - Current Path
.. - Parent Directory



Absolute Vs. Relative Paths

An absolute path specifies the complete location of a directory, starting from the root of the file system.

        cd C:\Users\Username\Documents

In contrast, a relative path refers to a directory's location in relation to the current directory.

    For instance:

        ..documents/report.pdf
#>
#end







#Example 4: Using Set-Location for a PowerShell Script

param(
    [string]$Path
)
Set-Location $Path

#To Execute: .\<file.ps1> -Path "C:\MyFiles"
#end
