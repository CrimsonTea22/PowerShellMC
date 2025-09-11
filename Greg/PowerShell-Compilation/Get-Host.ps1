

# Determine your version of PowerShell - $PSVersionTable

$PSVersionTable

<#

If you're running a version of Windows PowerShell older than 5.1,
you should update your version of Windows.

Windows PowerShell 5.1 is preinstalled on the currently supported versions of Windows.

PowerShell version 7 isn't a replacement for Windows PowerShell 5.1;
it installs side-by-side with Windows PowerShell.

Windows PowerShell version 5.1 and PowerShell version 7 are two different products.

For more information about the differences between Windows PowerShell version 5.1 and PowerShell version 7,
see Migrating from Windows PowerShell 5.1 to PowerShell 7.

https://learn.microsoft.com/en-us/powershell/scripting/whats-new/migrating-from-windows-powershell-51-to-powershell-7?view=powershell-7.5

Tip

PowerShell version 6, formerly known as PowerShell Core, is no longer supported.

#>


# Determine your version of PowerShell - $PSVersionTable.PSVersion

$PSVersionTable.PSVersion

<#

This could be obtained from Keys - $PSVersionTable.Keys
Or simply from the $PSVersionTable output

#>


# Determine your version of PowerShell - $PSVersionTable.PSVersion.major

$PSVersionTable.PSVersion.Major

<#

This could be obtained from Keys - $PSVersionTable.PSVersion
Or simply from the $PSVersionTable.PSVersion | Get-Member output

#>


# Get-Host
# Gets an object that represents the current host program

Get-Host

# Description

<#

The Get-Host cmdlet gets an object that represents the program that is hosting Windows PowerShell.

The default display includes the Windows PowerShell version number;
and the current region and language settings that the host is using,
but the host object contains a wealth of information,
including detailed information about the version of Windows PowerShell
that is currently running and the current culture and UI culture of Windows PowerShell.

You can also use this cmdlet to customize features of the host program user interface,
 such as the text and background colors.


#>

# Example 1: Get information about the PowerShell console host

Get-Host

<#

This command displays information about the PowerShell console,
which is the current host program for PowerShell in this example.

It includes the name of the host, the version of PowerShell that is running in the host,
and current culture and UI culture.

The Version, UI, CurrentCulture, CurrentUICulture, PrivateData, and Runspace properties
each contain an object with other useful properties.

Later examples examine these properties.

#>


# Example 2: Get information about the PowerShell console host

$H = Get-Host
$Win = $H.UI.RawUI.WindowSize
$Win.Height = 10
$Win.Width  = 10
$H.UI.RawUI.Set_WindowSize($Win)

<#

This command resizes the Windows PowerShell window to 10 lines by 10 characters.

#>



# Example 3: Get the PowerShell version for the host

(Get-Host).Version

<#

This command gets detailed information about the version of Windows PowerShell running in the host.
You can view, but not change, these values.

The Version property of Get-Host contains a System.Version object.

This command uses a pipeline operator (|) to send the version object to the Format-List cmdlet.

The Format-List command uses the Property parameter with a value of all (*)
to display all of the properties and property values of the version object.

#>




# Example 4: Get the current culture for the host

(Get-Host).CurrentCulture | Format-List

Get-Culture

<#

This command gets detailed information about the current culture set
for Windows PowerShell running in the host.

This is the same information that is returned by the Get-Culture cmdlet.

Similarly, the CurrentUICulture property returns the same object that Get-UICulture returns.

The CurrentCulture property of the host object contains a System.Globalization.CultureInfo object.

This command uses a pipeline operator (|) to send the CultureInfo object to the Format-List cmdlet.

The Format-List command uses the Property parameter with a value of all (*)
to display all of the properties and property values of the CultureInfo object.

#>



# Example 5: Get the DateTimeFormat for the current culture

(Get-Host).CurrentCulture.DateTimeFormat | Format-List

<#

This command returns detailed information about the DateTimeFormat of the current culture
that is being used for Windows PowerShell.

The CurrentCulture property of the host object contains a CultureInfo object that,
in turn, has many useful properties.

Among them, the DateTimeFormat property contains a DateTimeFormatInfo object with many useful properties.

To find the type of an object that is stored in an object property, use the Get-Member cmdlet.
To display the property values of the object, use the Format-List cmdlet.

#>


# Example 6: Get the RawUI property for the host

(Get-Host).UI.RawUI

<#

This command displays the properties of the RawUI property of the host object.

By changing these values, you can change the appearance of the host program.


Note:

On non-Windows platforms, ForegroundColor and BackgroundColor default to -1
because there is no consistent way to get these on non-Windows platforms.


#>