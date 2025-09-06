
#3 Array & ArrayList

<#

Array

    - good to use if under hundred elements

ArrayList
    - would be always picked over ( better option.  )
    - you just have an extra typing
    - gives great performance, especially you don't know the number of your data sets/elements

#>

# Array


#Example1: variable and array - GetType()

$myArray = @()

$myArray.GetType()

<#

@() - Array Symbol

NOTE: If it's a property, we don't use (). () are only for methods.

#>
#end



# Example 2:

$myArray.IsFixedSize


<#

@() - Array Symbol

NOTE: If it's a property, we don't use (). () are only for methods.


Output:
PS C:\PowerShellMC\Greg\PowerShell-Compilation> $myArray.IsFixedSize
True

This means that the array is a fixed size.

If it's a fixed size, how can I add or remove elements to it?

    PowerShell works in background.

    It destroys the array;
    and creates a new one with that new element inside of it.

    e.g. If you're constantly adding an element - let's say 1000 elements

        As you add element, it destroys the previous created array of elements;
        and then create a new one.

    Hence, as you add elements, the performance degrades drastically.

#>
#end




# Example 3: Properties - Length & Count


$myArray = @("Test1", "Test2", "Test3")

$myArray.Count

$myArray.Length

<#

Length and Count - provides the exact same numbers

#>
#end





# Example 4: Index and Square Brackets []

$myArray = @("Test1", "Test2", "Test3")

$myArray

$myArray[3]

<#

With an index, it is zero-based

e.g.

Test1 - index 0
Test2 - index 1
Test3 - index 2

NOTE: Putting an index beyond the number of elements would create an empty output. It doesn't exist.

Output:
PS C:\PowerShellMC\Greg\PowerShell-Compilation> $myArray[3]
PS C:\PowerShellMC\Greg\PowerShell-Compilation>

#>
#end






# Example 5: Index and Square Brackets [] & Set-StrictMode

Set-StrictMode -Version Latest
Set-StrictMode Off

$myArray = @("Test1", "Test2", "Test3")

$myArray

$myArray[3]

<#

With Set-StrictMode -Version Latest, it will output the error.

PS C:\PowerShellMC\Greg\PowerShell-Compilation> Set-StrictMode -Version Latest

Output:
OperationStopped:
Line |
   7 |  $myArray[3]
     |  ~~~~~~~~~~~
     | Index was outside the bounds of the array.
PS C:\PowerShellMC\Greg\PowerShell-Compilation>


If your're looping through an array, iterating through each item in an array;
You don't necessarily have to set the strict mode on.
The amount of times that you would actually go out of bounds is great,
there are a lot of ways to go out of bounds of an array.

#>
#end






# Example 6: Method .Add

$myArray = @("Test1", "Test2", "Test3")

$myArray.Add("Test4")


<#

PS C:\PowerShellMC\Greg\PowerShell-Compilation> $myArray = @("Test1", "Test2", "Test3")

$myArray.Add("Test4")
MethodInvocationException:
Line |
   3 |  $myArray.Add("Test4")
     |  ~~~~~~~~~~~~~~~~~~~~~
     | Exception calling "Add" with "1" argument(s): "Collection was of a fixed size."


NOTE: The method .Add ins't the way to add an array item/element.

#>
#end






# Example 7: Adding elements to an array using variable and +

$myArray = @("Test1", "Test2", "Test3")

$myArray = $myArray + "Test4"

$myArray

$myArray.Count
#end





# Example 8: Adding elements to an array using +=

$myArray = @("Test1", "Test2", "Test3")

$myArray += "Test4"

$myArray

$myArray.Length
#end





# Example 9: Methods: Remove and RemoveAt


$myArray = @("Test1", "Test2", "Test3")

$myArray.RemoveAt(1)

<#

PS C:\PowerShellMC\Greg\PowerShell-Compilation> $myArray.RemoveAt(1)
MethodInvocationException: Exception calling "RemoveAt" with "1" argument(s): "Collection was of a fixed size."

Error occured, because the array isn't a fixed size anymore.

.RemoveAt is used to remove indices.

#>
#end





# Example 10: Removing items in an array

$myArray = @("Test1", "Test2", "Test3")

$myArray = $myArray -ne "Test2"

$myArray

<#

You cannot remove a specific index.

#>
#end



# ArrayList
