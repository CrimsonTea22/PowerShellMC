
# 6. How to use PowerShell Try, Catch and the Write-Verbose and Write-Debug

<#

Contents:

1 . 	Introduction
2 .	    Error variable
3 . 	Custom error variable
4 . 	Try-Catch
5 . 	ErrorAction
6 . 	Error details
7 . 	Error specific Catch
8 . 	ErrorActionPreference
9 . 	Errors from cmd.exe
10. 	Messages in scripts
11. 	Using CmdletBinding, Write-Verbose and Write-Debug
12. 	Summary and close


#>

# 1 . 	Introduction

<#

Diving into the Try, Catch Error Handling inside our PowerShell scripts;
and also have a quick look at the Write-Verbose, Write-Debug that might help us day-to-day

#>
#end


# 2 .	 Error variable

<#

What happens when we get some error in our PowerShell Scripts?

On VS Code, the comments and the docs are great - the whole exception.

Documentation Is Phenomenal.

Link:

https://learn.microsoft.com/en-us/powershell/scripting/learn/deep-dives/everything-about-exceptions?view=powershell-7.5&viewFallbackFrom=powershell-7.1

Look For: Error Variable

File: HandlingErrors.ps1

Looking at a regular error

Let's say i go and get some content from a path that doesn't actually exist;


Get-Content -Path r:\doesnoteexist\notthere.txt


Output:

PS C:\PowerShellMC> Get-Content -Path r:\doesnoteexist\notthere.txt
Get-Content: Cannot find drive. A drive with the name 'r' does not exist.





Now i could also just throw my own error using the Throw command;
but before i do that well i can look at what the lasterror was - i can do Get-Error


Get-Error


NOTE: Run and see the output.



Now, when we run get error, we can see a whole bunch of information:

    - drive not found exception

        Type                 : System.Management.Automation.DriveNotFoundException

    - target object

        TargetObject          : r

    - the category

        CategoryInfo          : ObjectNotFound: (r:String) [], ParentContainsErrorRecordException

    - the item name

         ItemName             : r

    - the target

        TargetSite           :
        Name          : GetDrive
        DeclaringType : [System.Management.Automation.SessionStateInternal]
        MemberType    : Method
        Module        : System.Management.Automation.dll

    - the stack trace message

        StackTrace           :
        at System.Management.Automation.SessionStateInternal.GetDrive(String name, Boolean automount)...

    - the source

          Source               : System.Management.Automation


That's a very useful one that we can actually call on and get the detail around.


$Error

Output:

PS C:\PowerShellMC> $Error
Get-Content: Cannot find drive. A drive with the name 'r' does not exist.

This is kind of cumulative - it adds it to this variable for mysession




If went and Throw the error.

Output:

PS C:\PowerShellMC> Throw("Johns Error")
Exception: Johns Error



But now if i look at the error variable.


PS C:\PowerShellMC> $Error
Exception: Johns Error
Get-Content: Cannot find drive. A drive with the name 'r' does not exist.


i can see two errors ican see hey the last error was john'serror
and then there was this hey get contentthe one before



#>

# Region Regular Error
# Let's make an Error

Get-Content -Path r:\doesnoteexist\notthere.txt

# Look at the Last Error

Get-Error

# The default error variable that errors added to

$Error

# Throw the error

Throw("Johns Error") #can always just throw my own!

# To clear the error variable

$Error.clear()
#endregion


# 3 . 	Custom error variable

<#

Handling error in a different way using Custom Error Variables.

Writing Custom Error Variables.

Get-Content -Path r:\doesnotexist\nothere.txt -ErrorVariable BadThings

NOTE: We've added -ErrorVariable BadThings


Output:

PS C:\PowerShellMC> Get-Content -Path r:\doesnotexist\nothere.txt -ErrorVariable BadThings
Get-Content: Cannot find drive. A drive with the name 'r' does not exist.



To get the last error.

Get-Error



To verify.

$BadThings


Output:

PS C:\PowerShellMC> $BadThings
Get-Content: Cannot find drive. A drive with the name 'r' does not exist.


If statement. A code to check:

if($BadThings)
{
    Write-Host -ForegroundColor Blue -BackgroundColor White "Had an issue, $($BadThings.Exception.Message)"
}


NOTE: We're diving to the exception part of the Error Message.

#>


# Region Custom variable

# Writing Custom Error Variables.

Get-Content -Path r:\doesnotexist\nothere.txt -ErrorVariable BadThings #NOTE: if did +BadThings would add content to existing

# To verify

$BadThings

#To get the last error.

Get-Error

# If statement to verify

if($BadThings)
{
    Write-Host -ForegroundColor Blue -BackgroundColor White "Had an issue, $($BadThings.Exception.Message)"
}
#Endregion


# 4 . 	Try-Catch

<#

The Better Option: Try-Catch

"hey i want to try and do something;
and if there's an error, catch it;
and do something specific in this piece of code"



Handle the error with try-catch

try {
    Get-Content -Path r:\doesnotexist\nothere.txt
}
catch {
    Write-Output "Something went wrong"
}


NOTE: It didn't actually work upon execition.

It just output the same standard kind of error

"Something went wrong" line isn't appearing


So, why didn't thatwork?

the reason is try catch catches a terminating error;
whereas that path not found is not a terminating error


So, let's do a try catch this time - calling just complete garbage.
That means it's terminating;
It's going to cause a proble;
And i should see no idea what that was and sure enough i do.



Handle the error with try-catch. With terminating error.

try {
    asdf-asdfasd #garbage and is terminating
}
catch {
    write-output "No idea what that was"
}


NOTE: output down the bottom - no idea  what that was - because it was terminating

now if i ordinarily just run that one line; i get this whole set of things

asdf-asdfasd #garbage and is terminating


So, somehow i need to make those commands that aren'tnormally terminating;
a terminating, a stop event

#>
#end

#Region Using Try-Catch
#Handle the error with try-catch
try {
    Get-Content -Path r:\doesnotexist\nothere.txt
}
catch {
    Write-Output "Something went wrong"
}

#Didn't work, why?
#Endregion


#Region Try-Catch terminating
#We have to set an error action for the try-catch to work since the get-content by default is not a terminating error
#Try-catch only catches terminating errors, e.g
try {
    asdf-asdfasd #garbage and is terminating
}
catch {
    write-output "No idea what that was"
}
#Endregion
