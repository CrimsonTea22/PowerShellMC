
# Working with files and folders


# Contents

<#
1. Get-ChildItem
2. Example

#>

<#

Navigating through PowerShell drives and manipulating the items on them
is similar to manipulating files and folders on Windows disk drives.

This article discusses how to deal with specific file and folder manipulation tasks using PowerShell.

#>


# Example 1: Listing all files and folders within a folder -Force

Get-ChildItem -Path C:\ -Force

<#

You can get all items directly within a folder using Get-ChildItem.

Add the optional Force parameter to display hidden or system items.

For example, this command displays the direct contents of PowerShell Drive C:.

#>
#end




# Example 2: Listing all files and folders within a folder -Force -Recurse

Get-ChildItem -Path C:\ -Force -Recurse

<#

The command lists only the directly contained items,
much like using the dir command in cmd.exe or ls in a Unix shell.

To show items in subfolder, you need to specify the Recurse parameter.

The following command lists everything on the C: drive:

#>
#end



# Example 3: Listing all files and folders within a folder with complext filtering

Get-ChildItem -Path $Env:ProgramFiles -Recurse -Include *.exe |
    Where-Object -FilterScript {
        ($_.LastWriteTime -gt '2005-10-01') -and ($_.Length -ge 1mb) -and ($_.Length -le 10mb)
    }

<#

Get-ChildItem can filter items with its Path, Filter, Include, and Exclude parameters,
but those are typically based only on name.

You can perform complex filtering based on other properties of items using Where-Object.

The following command finds all executables within the Program Files folder
that were last modified after October 1, 2005
and that are neither smaller than 1 megabyte nor larger than 10 megabytes:

#>
#end