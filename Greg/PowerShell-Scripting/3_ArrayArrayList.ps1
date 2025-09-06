
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





# ArrayList - the most picked. much better.


# Example 1: Creating an ArrayList 1

$mylist1 = [System.Collections.ArrayList]@()

$mylist1.GetType()

<#

In this method, the ArrayList is casted into the Array.

It is an added task in the background.

#>
#end





# Example 2: Creating an ArrayList 2 - recommended way

$mylist2 = New-Object -TypeName System.Collections.ArrayList

$mylist2.GetType()

<#
In this method, it just strictly create a new item of ArrayList Type.
#>
#end





# Example 3: IsFixedSize

$myList = New-Object -TypeName System.Collections.ArrayList

$myList.IsFixedSize

<#

PS C:\PowerShellMC\Greg\PowerShell-Compilation> $myList = New-Object -TypeName System.Collections.ArrayList

$myList.IsFixedSize
False

Array - fixed size
ArrayList - not a fixed size

#>
#end





# Example 4: Adding Elements into the ArrayList - .Add

$myList = New-Object -TypeName System.Collections.ArrayList

$myList.Add("Test1")
$myList.Add("Test2")

$mylist

<#

PS C:\PowerShellMC\Greg\PowerShell-Compilation> $myList = New-Object -TypeName System.Collections.ArrayList

$myList.Add("Test1")
$myList.Add("Test2")

$mylist
0
1

You're adding index to the array list
#>
#end





# Example 5: Nullifying Output

$myList = New-Object -TypeName System.Collections.ArrayList

$myList.Add("Test1")
#[void]$myList.Add("Test2")

$myList

<#

PS C:\PowerShellMC\Greg\PowerShell-Compilation> $myList = New-Object -TypeName System.Collections.ArrayList

$myList.Add("Test1")
0
PS C:\PowerShellMC\Greg\PowerShell-Compilation>
PS C:\PowerShellMC\Greg\PowerShell-Compilation> $myList.Add("Test1")
$myList.Add("Test2")
1
2

You're adding index to the array list
#>
#end






# Example 6: Adding Elements into the ArrayList - .AddRange

$myList = New-Object -TypeName System.Collections.ArrayList

$myList.Add("Test1")
$myList.Add("Test2")
$myList.AddRange(@("Test3","Test4"))

$myList

$myList[2]

<#

PS C:\PowerShellMC\Greg\PowerShell-Compilation>
PS C:\PowerShellMC\Greg\PowerShell-Compilation> $myList = New-Object -TypeName System.Collections.ArrayList

$myList.Add("Test1")
$myList.Add("Test2")
$myList.AddRange(@("Test3","Test4"))

$myList

$myList[2]
0
1
Test1
Test2
Test3
Test4
Test3

AddRange allows you to add an array of items
#>
#end





# Example 7: Removing Elements into the ArrayList - .Remove

$myList = New-Object -TypeName System.Collections.ArrayList

$myList.Add("Test1")
$myList.Add("Test2")
$myList.AddRange(@("Test3","Test4","Test2"))

$myList.Remove("Test2")

$myList

<#

PS C:\PowerShellMC\Greg\PowerShell-Compilation> $myList = New-Object -TypeName System.Collections.ArrayList

$myList.Add("Test1")
$myList.Add("Test2")
$myList.AddRange(@("Test3","Test4"))

$myList.Remove("Test2")

$myList

0
1
Test1
Test3
Test4

ArrayList has a very intuitive removal method.

$myList.Remove("Test2") would only remove the first instance of that same element.

It uses the string.

#>
#end





# Example 8: Removing Elements into the ArrayList - .RemoveAt

$myList = New-Object -TypeName System.Collections.ArrayList

$myList.Add("Test1")
$myList.Add("Test2")
$myList.AddRange(@("Test3","Test4","Test2"))

$myList.RemoveAt(0)

$myList

<#

PS C:\PowerShellMC\Greg\PowerShell-Compilation> $myList = New-Object -TypeName System.Collections.ArrayList

$myList.Add("Test1")
$myList.Add("Test2")
$myList.AddRange(@("Test3","Test4","Test2"))

$myList.RemoveAt(0)

$myList
0
1
Test2
Test3
Test4
Test2


$myList.RemoveAt(0)
RemoveAt uses the index.

#>
#end




# Example 9: Removing Elements into the ArrayList - .RemoveRange

$myList = New-Object -TypeName System.Collections.ArrayList

$myList.Add("Test1")
$myList.Add("Test2")
$myList.AddRange(@("Test3","Test4"))

$myList.RemoveRange(1,2)

$myList

<#

PS C:\PowerShellMC\Greg\PowerShell-Compilation>
$myList = New-Object -TypeName System.Collections.ArrayList

$myList.Add("Test1")
$myList.Add("Test2")
$myList.AddRange(@("Test3","Test4"))

$myList.RemoveRange(1,2)
0
1
PS C:\PowerShellMC\Greg\PowerShell-Compilation>
PS C:\PowerShellMC\Greg\PowerShell-Compilation> $myList
Test1
Test4

RemoveRange uses indices.

#>
#end















# Performance Difference: Array Vs. ArrayList

# Example 1: Measure-Command

$array=@()
Measure-Command -Expression {@(0..50000).foreach({$array+=$_})}

<#

PS C:\PowerShellMC\Greg\PowerShell-Compilation> $array=@()
Measure-Command -Expression {@(0..50000).foreach({$array+=$_})}

Days              : 0
Hours             : 0
Minutes           : 0
Seconds           : 9
Milliseconds      : 303
Ticks             : 93033326
TotalDays         : 0.000107677460648148
TotalHours        : 0.00258425905555556
TotalMinutes      : 0.155055543333333
TotalSeconds      : 9.3033326
TotalMilliseconds : 9303.3326


9 seconds for the array to iterate through 50000 elements; and add it to the array.

#>


$arrayList = New-Object -TypeName System.Collections.ArrayList
Measure-Command -Expression {@(0..50000).foreach({$arrayList.Add($_)})}

<#

PS C:\PowerShellMC\Greg\PowerShell-Compilation> $arrayList = New-Object -TypeName System.Collections.ArrayList
Measure-Command -Expression {@(0..50000).foreach({$arrayList.Add($_)})}

Days              : 0
Hours             : 0
Minutes           : 0
Seconds           : 0
Milliseconds      : 153
Ticks             : 1537684
TotalDays         : 1.77972685185185E-06
TotalHours        : 4.27134444444444E-05
TotalMinutes      : 0.00256280666666667
TotalSeconds      : 0.1537684
TotalMilliseconds : 153.7684

PS C:\PowerShellMC\Greg\PowerShell-Compilation> $array=@()

153 milliseconds for the array to iterate through 50000 elements; and add it to the array.
#>


#faster -- AddRange

$arrayList = New-Object -TypeName System.Collections.ArrayList
Measure-Command -Expression {$arrayList.AddRange(@(0..50000))}

<#
PS C:\PowerShellMC\Greg\PowerShell-Compilation>
$arrayList = New-Object -TypeName System.Collections.ArrayList
Measure-Command -Expression {$arrayList.AddRange(@(0..50000))}

Days              : 0
Hours             : 0
Minutes           : 0
Seconds           : 0
Milliseconds      : 16
Ticks             : 168156
TotalDays         : 1.94625E-07
TotalHours        : 4.671E-06
TotalMinutes      : 0.00028026
TotalSeconds      : 0.0168156
TotalMilliseconds : 16.8156


16 milliseconds for the array to iterate through 50000 elements; and add it to the array.

#>
#end
