
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



# 5. Error Action


<#
We're going to perform ErrorAction

We add this to th end of to our regular PowerShell commands -ErrorAction

-ErrorAction Stop

NOTE: it now makes it terminating


try {
    Get-Content -Path r:\doesnotexist\nothere.txt -ErrorAction Stop
}
catch {
    Write-Output "Something went wrong"
}

NOTE:
Notice that it doesn't output the regular error;
It outputs something went wrong.
That command executing now has an error action of stop - Terminating.
Hence, catch can well catch it.


Different Type of Error Actions

	1. -ErrorAction Stop
	2. -ErrorAction SilentlyContinue
	3. -ErrorAction Supend

NOTE: There's a whole bunch of different options



-ErrorAction SilentlyContinue


try {
    Get-Content -Path r:\doesnotexist\nothere.txt -ErrorAction SilentlyContinue
}
catch {
    Write-Output "Something went wrong"
}


NOTE: when we run this; there's no error, but it did still error.
It just silently continued if I do get error.

It's be like," i can see it's still there. it's still that hey drive not found

i can still see hey notthere42.txt  proving it actually was this error"

NOTE: that is actually causing this but it just silently carried on

NOTE: There are differen kinds/types of ErrorAction

#>
#end


#Region Make terminating with ErrorAction
#Make our normal non-terminating error a terminating with the error action
try {
    Get-Content -Path r:\doesnotexist\nothere.txt -ErrorAction Stop
}
catch {
    Write-Output "Something went wrong"
}

# -ErrorAction SilentlyContinue
try {
    Get-Content -Path r:\doesnotexist\nothere.txt -ErrorAction SilentlyContinue
}
catch {
    Write-Output "Something went wrong"
}
#Endregion


#Region Types of error action
#Note there are other types of ErrorAction
Get-Content -Path r:\doesnotexist\nothere42.txt -ErrorAction SilentlyContinue
Get-Error #still errored, we just didn't see it!
#Endregion



# 6 . 	Error details

<#

We can absolute look on the details of Error.


try {
    Get-Content -Path r:\doesnotexist\nothere.txt -ErrorAction Stop
}
catch {
    $ErrorMessage = $_.Exception.Message
    Write-Output "Something went wrong - $ErrorMessage"
    write-host -ForegroundColor Blue -BackgroundColor White $_.Exception #Entire exception
    #Information about where exception was thrown
    $PSItem.InvocationInfo | Format-List * #can also use $PSItem instead of $_
}


We're actually going to get the actual error message.

NOTE: $_ is similar with $PSItem

Interchangeability:
$_ is an alias for $PSItem, and they can be used interchangeably in most scenarios.

$PSItem was introduced in PowerShell 3.0 to provide a more descriptive and readable alternative to $_.


$ErrorMessage = $_.Exception.Message

NOTE:
I'm going to look at the exception and the message
I'm going to store that in this $ErrorMessage variable

So, instead of having that kind of glaring output it normally gives;
I can now control that.

What i'm going to do is Write-Output.
"Hey something went wrong in the message"

Then, i'm going to use Write-Host,
so i can do some different formatting to output the entire exception

And then also to demonstrate i can use $PSItem instead of $_

I'm going to output the invocation info

I.E. the information that led up to actually having this where the calls came from



Command Execution

NOTE:

So now if i take this and execute;
we had a whole bunch of different information

So firstly okay we get our something went wrong;
and then it added the message

Then we can see here i've actually got my exception -
with my blue on white output

And then i can see that invocation info:

	the invocation name, pipeline length

I can see all the things that actually led up to that.

So, get that fullset of information.
So, this is where it gets really powerful that
Hey i can use the exception, i can get the details of the exception.

There's all different components actually to that exception; and the documentation goes into hugedetails about this

#>


#Region Looking at details
#Can look at the error details
try {
    Get-Content -Path r:\doesnotexist\nothere.txt -ErrorAction Stop
}
catch {
    $ErrorMessage = $_.Exception.Message
    Write-Output "Something went wrong - $ErrorMessage"
    write-host -ForegroundColor Blue -BackgroundColor White $_.Exception #Entire exception
    #Information about where exception was thrown
    $PSItem.InvocationInfo | Format-List * #can also use $PSItem instead of $_
}
#Endregion



# 7 . 	Error specific Catch

<#


Error specific Catch

Potentially, I may want to do different things depending on the type of error

So, what i can actually do is have different types of catch



try {
    asdf-asdfasd #garbage and is terminating
}
catch [System.Management.Automation.CommandNotFoundException] {
    write-output "no idea what this command is"
}
catch {
    $_.Exception
}



Here, I've got this gobbledy gook error

So, this is going to be a command not found

So, notice here I've got a catch -
if it is command not found;
and then i've got kind of a default catch for everything else

So if i do the Try-Catch here calling my non-existent command




Command Execution

hey no idea what this command is

That's the output i get because it was a command not found exception

i don't get it just outputting the overall exception

so i can do some really nice things in here to actually work out
i might get different types of exception
i want to do different things

so i can use that with the actual type of exception i see

#>


#Region Types of catch
#Catch can be used with specific types of exception but needs to be terminating type
try {
    asdf-asdfasd #garbage and is terminating
}
catch [System.Management.Automation.CommandNotFoundException] {
    write-output "no idea what this command is"
}
catch {
    $_.Exception
}
#Endregion


# 8 . 	ErrorActionPreference

<#
What if i can't use that error action stop?

$ErrorActionPreference

	- There's an error action preference
	- This is a variable.

What we could actually do if we're in a situation where I can't set the error action to stop?
Maybe i'm calling outside of powershell?

what i could actually do is i could change the default Error Action Preference to stop

Now i want to be careful with this.
I don't want to just set it to a new value and then just carry on

So, what i would do is i'd want to store the current value.

Do whatever i want to do after I've set it to what i want;
i stop and then put it back.

Which is what we'regoing to do in this script


$ErrorActionPreference

try {
    $CurrentErrorActionPreference = $ErrorActionPreference
    $ErrorActionPreference = "Stop"
    Get-Content -Path r:\doesnotexist\nothere.txt #any command here, e.g. cmd /c
}
catch {
    Write-Output "Something went wrong"
    write-host -ForegroundColor Blue -BackgroundColor White $_.Exception.Message
}
Finally {
    $ErrorActionPreference = $CurrentErrorActionPreference
}


First thing is we're going to capture the current value into a current error action preference;
then i'm going to set it to what i want it to be i stop

And i'm doing that regular Get-Content command;
but notice i don't have the dash error action at the end of it

Now i have a Catch something went wrong write out the message;
But then i need to put it back no matter what whether it failed or not;
I have to set the $ErrorActionPreference back to what it was before

so this is where we use Finally

So, what Finally lets us do is error or not this code will always run

So, Finally set the  $ErrorActionPreference back to what it was originally.
I.E. that current error action preference variable.
I created where i copied in the originalvalue

So,  i'm going to set it back



Command Execution.


So, it it got called even though i didn't do the ErrorAction -Stop
because i set the default, and it outputted in my formatting -- the message with that blue on white

but if i actually look at my  $ErrorActionPreference

it's still continue, it all got set back

so if i have a scenario where i can't do ErrorAction -Stop
I want to still handle that in my try catch;
then i can set the$ErrorActionPreference but make sure you set it backafterwards

#>



#Region Using ErrorActionPreference
#There is a default error action that is overriden by the -ErrorAction

$ErrorActionPreference

#This can be useful when we cannot set ErrorAction, e.g. a non-PowerShell call

try {
    $CurrentErrorActionPreference = $ErrorActionPreference
    $ErrorActionPreference = "Stop"
    Get-Content -Path r:\doesnotexist\nothere.txt #any command here, e.g. cmd /c
}
catch {
    Write-Output "Something went wrong"
    write-host -ForegroundColor Blue -BackgroundColor White $_.Exception.Message
}
Finally {
    $ErrorActionPreference = $CurrentErrorActionPreference
}
#End Region
