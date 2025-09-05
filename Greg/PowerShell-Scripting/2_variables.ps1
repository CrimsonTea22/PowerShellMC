

# Variables

<# Description

Description:

Declaration of variables is what separates it from coding language to coding language.

Variables are exactly the same way in your Algebra Subject.

Defining the value of x or y. Then calculate it. Then x or y has values.

You can store them to have values.
You can store strings -- wrapped in double quotes.
integers
booleans

#>


# Example 1: camelCasting

<#

lowercase for the first word;
uppercase for the Second word.

#>
#end



# Example 2: Simple Variable Declaration

$myVariable = "Greg's Wealthy"

$myVariable
#end



# Example 3: Variables and Strings - Methods and Properties

$myVariable2 = "12"

$myVariable2.GetType()


<#

String - anything with double quotes within.

In PowerShell, " " and ' ' are consdiered strings



Methods & Properties

    This is where the autopopulate feature appears.

    Wrench - Property
    Cube - Method

    Property - Object's or value's property
    Methods - what can you run a specific value


#>
#end



# Example 4: Variables and Integers

$myVariable2 = 12

$myVariable2.GetType()

<#

Notice the Name and the BaseType changes

Integer  - a rounded or whole number;
        positive or negative - these are 32-bit integers in PowerShell

#>
#end




# Example 5: Variables and Doubles


$myVariable2 = 12.11111111

$myVariable2.GetType()


<#

Notice the Name and the BaseType changes

Double  - has a decimal point.

Used for financial applications.

#>
#end




# Example 6: Mathematical Operations

$myValue1 = 11
$myValue2 = 22
$myValue3 = 33

$myResults = $myValue1 + $myValue2 + $myValue3

<#
Mathematical Signs

    +
    -
    *
    /
    -eq
    gt
    lt
    ge
    le
    % - modulo; modulus - leftover function

#>
#end




# Example 7: Mathematical Operations - modulo


$myValue1 = 11
$myValue2 = 22
$myValue3 = 33

$myResults = $myValue3 / $myValue1
$myResults = $myValue3 % $myValue1

$myResults


<#
Mathematical Sign

    % - modulo; modulus - leftover function - remainder

    Hence, module allows us to identify if the number is even.

#>
#end




# Example 8: Variables and Boolean

$myStatement = $true

$myStatement.GetType()

$true=1 # see error

<#

Boolean - simply either true or false.

$true and $false - is a preset or predefined values in PowerShell # see error

#>
#end



# Example 9: Variables and Boolean 2


$myValue1 = 11
$myValue2 = 22
$myValue3 = 33

$myValue1 -eq $myValue2 # see value

($myValue1 -eq $myValue2).GetType()

<#

Boolean - simply either true or false.

$true and $false - is a preset or predefined values in PowerShell # see error

#>
#end




# Example 10: Referencing a variable to an undeclared variable.

$myNewResult

Set-StrictMode -Version latest
$myNewResult

Set-StrictMode -Off
$myNewResult


<#

In most programming language,
referencing a variable to an undeclared variable would produce empty or error results.

And this isn't a default functionality in PowerShell.

To verify:

PS C:\PowerShellMC\Greg\PowerShell-Scripting> Set-StrictMode -Version latest
PS C:\PowerShellMC\Greg\PowerShell-Scripting>
PS C:\PowerShellMC\Greg\PowerShell-Scripting> $myNewResult
InvalidOperation: The variable '$myNewResult' cannot be retrieved because it has not been set.

To turn off:

PS C:\PowerShellMC\Greg\PowerShell-Scripting> Set-StrictMode -Off
PS C:\PowerShellMC\Greg\PowerShell-Scripting> $myNewResult
PS C:\PowerShellMC\Greg\PowerShell-Scripting>

NOTE: The above is actuallu a null value

#>
#end



# Example 11: Referencing a variable to an undeclared variable. Null Value

$myNewResult

Set-StrictMode -Version latest
$myNewResult

Set-StrictMode -Off
$myNewResult

$null # predefined value just like $true and $false

$myNewResult -eq $null

<#

For Null Value:

PS C:\PowerShellMC\Greg\PowerShell-Scripting> $myNewResult -eq $null
True



For an errored value:

PS C:\PowerShellMC\Greg\PowerShell-Scripting> Set-StrictMode -Version latest
PS C:\PowerShellMC\Greg\PowerShell-Scripting>
PS C:\PowerShellMC\Greg\PowerShell-Scripting> $myNewResult -eq $null
InvalidOperation: The variable '$myNewResult' cannot be retrieved because it has not been set.

NOTE: using the strictmode is a good way in debugging your variables, especially the undeclared ones.

#>
#end




# Example 12: Typing variables - assigning the type of variable to the variable itself.


$myValue1 = 11.11

$myValue1
$myValue1.GetType()

[int]$myValue1 = 11.11

$myValue1.GetType()

[double]$myValue2 = 22.22

$myValue2.GetType()

$myValue3 = 33


<#

Notice how the Name changes for each output.

#>
#end



# Example 13: Variable and Get-Date

Get-Date

$today=Get-Date

$today
#end
