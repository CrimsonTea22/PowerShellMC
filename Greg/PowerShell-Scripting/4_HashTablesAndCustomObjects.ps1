# HashTable & Custom Objects

# HashTable

<#

    - very similar to dictionaries

    - they are key value pairs

    - there will be a unique key for every value in the hash table

    - it makes lookups very ease --
    you lookup the key;
    if the keys exists, you grab the value instead of index positioning

#>

# Example 1: Creating HashTable

$myHashTable = @{}

$myHashTable = @{
    key1 = 100
    apple = 2.34
    name = "Cristine"
    key2 = 200
    key3 = $true
}

$myHashTable.GetType()

<#

@{} - hashtable symbol

#>

#end



# Example 2: Property - IsFixedSize

$myHashTable = @{
    key1 = 100
    apple = 2.34
    name = "Cristine"
    key2 = 200
    key3 = $true
}
$myHashTable.IsFixedSize
#end



# Example 3: Properties - Keys and Values

$myHashTable = @{
    key1 = 100
    apple = 2.34
    name = "Cristine"
    key2 = 200
    key3 = $true
}

$myHashTable.Keys
$myHashTable.Values
#end



# Example 4: Getting the values of the keys 1: Dot Notation

$myHashTable = @{
    key1 = 100
    apple = 2.34
    name = "Cristine"
    key2 = 200
    key3 = $true
}

$myHashTable.key1
$myHashTable.name
$myHashTable.key3
#end



# Example 5: Getting the values of the keys 2: Square Brackets and Quotes

$myHashTable = @{
    key1 = 100
    apple = 2.34
    name = "Cristine"
    key2 = 200
    key3 = $true
}

$myHashTable['apple']
$myHashTable['key3']


$myHashTable.Count
#end




# Example 6: Properties: Count and Length

$myHashTable = @{
    key1 = 100
    apple = 2.34
    name = "Cristine"
    key2 = 200
    key3 = $true
}

$myHashTable.Count
$myHashTable.Length
#end




# Example 7: Non-existent Keys? How to determine if a key exist?

Set-StrictMode -Version Latest
Set-StrictMode Off

$myHashTable = @{
    key1 = 100
    apple = 2.34
    name = "Cristine"
    key2 = 200
    key3 = $true
}

$myHashTable.ContainsKey()

$myHashTable.ContainsKey('key4')
$myHashTable.ContainsKey('key3')

<#
In HashTables, Stictmode won't help you to identify if that key exist.
Hence, switch it off.

Use Case:

    If this key exist, then we could do something with it.

    If it doesn't exist, tell the user that it doesn't exist; maybe create it or you typed it wrongly.
#>
#end




# Example 8: Non-existent Values? How to determine if a value exist?

$myHashTable = @{
    key1 = 100
    apple = 2.34
    name = "Cristine"
    key2 = 200
    key3 = $true
}

$myHashTable.ContainsValue(100)
$myHashTable.ContainsValue(2)
$myHashTable.ContainsValue($true)
#end



# Example 9: Duplicate Keys aren't allowed - Keys are completely unique; values don't need to be.

Set-StrictMode -Version Latest
Set-StrictMode Off

$myHashTable = @{
    key1 = 100
    apple = 2.34
    name = "Cristine"
    key2 = 200
    name2 = "Cristine"
    key3 = $true
    key3 = $false
}

$myHashTable.ContainsKey('name2')
$myHashTable.ContainsKey('key3')

<#

hashtable use case :

    you could use a hashtable,
    if you have a bunch of records for users.
    You can actually store them in a hashtable --

    e.g. employee and employee ID

    keys = employee ID
    values = employee name

#>
#end




# Example 10: Adding keys and values to hashtable 1 - Method: Add

$myHashTable = @{
    key1 = 100
    apple = 2.34
    name = "Cristine"
    key2 = 200
    name2 = "Cristine"
    key3 = $true
}

$myHashTable.Add('','') # syntax

$myHashTable.Add('key4','added via add function')

# compiled
$myHashTable.Add("test1","Add Method")
$myHashTable["test2"]="square bracket"
$myHashTable.test2="Dot Notation"

$myHashTable
#end




# Example 11: Adding keys and values to hashtable 2 - Square Brackets

$myHashTable = @{
    key1 = 100
    apple = 2.34
    name = "Cristine"
    key2 = 200
    name2 = "Cristine"
    key3 = $true
}

$myHashTable['key6']="Added via square bracket"

$myHashTable
#end




# Example 12: Adding keys and values to hashtable 3 - Dot Notation

$myHashTable = @{
    key1 = 100
    apple = 2.34
    name = "Cristine"
    key2 = 200
    name2 = "Cristine"
    key3 = $true
}

$myHashTable.key7 = "Added via dot notation"

$myHashTable

<#

NOTE: Keys and Values will be added in an arbitrary order.

#>
#end




# Example 13: Changing Values

$myHashTable = @{
    key1 = 100
    apple = 2.34
    name = "Cristine"
    key2 = 200
    name2 = "Cristine"
    key3 = $true
}

$myHashTable.apple = 3.56

$myHashTable
#end




# Example 14: Removing Values

$myHashTable = @{
    key1 = 100
    apple = 2.34
    name = "Cristine"
    key2 = 200
    name2 = "Cristine"
    key3 = $true
}

$myHashTable.Remove("key1")

$myHashTable
#end


<#
Hashtables can be implmented in inventory sytems, employee database.

e.g. keys: product numbers; barcode numbers
    values: price
#>


########################################################################





# Custom Objects

<#

(1)
Jacked Programmer Explanation:

Objects are the prvious things we tackled:

    1. Strings
    2. Intergers
    3. Hashtables

And we could create our own custom objects.


(2)

Everything in PowerShell is an object.

An object is a combination of variables and functions.

Each object has:

    Properties: Variables that describe the object (characteristics).
    Methods: Functions that define how to use the object (actions).


(3)


Here are examples of common objects in PowerShell:

1. System Objects

    1.1. Process Objects
    Get-Process -Name notepad | Select-Object Name, Id, WorkingSet

    1.2 Service Objects
    Get-Service -Name "BITS" | Select-Object Name, Status, DisplayName

    1.3 File and Folder Objects
    Get-Item C:\Windows\System32\notepad.exe | Select-Object Name, Length, LastWriteTime

    1.4 String Objects
    $myString = "Hello, PowerShell!"
    $myString.Length
    $myString.ToUpper()

2. Custom Objects

    2.1 PSCustomObject

    $myCustomObject = [PSCustomObject]@{
        Name = "John Doe"
        Age = 30
        City = "New York"
    }
    $myCustomObject.Name


3. Pipeline Objects

    Objects Pass Through Pipeline:
    Get-Process | Where-Object {$_.CPU -gt 100} | Select-Object Name, CPU

#>

# Example 1: Creating Custom Objects 1: Longer Method

$Employee1 = New-Object -TypeName PSCustomObject

$Employee1.GetType()

# This is a PSCustomObject
#end





# Example 2: Add-Member

Set-StrictMode -Version Latest
Set-StrictMode Off

$Employee1 = New-Object -TypeName PSCustomObject

Add-Member -InputObject $Employee1 -MemberType NoteProperty -Name 'EmployeeID' -Value '1001'
Add-Member -InputObject $Employee1 -MemberType NoteProperty -Name 'FirstName' -Value 'Cristine'
Add-Member -InputObject $Employee1 -MemberType NoteProperty -Name 'Title' -Value 'Nurse'

$Employee1.Length

$Employee1.EmployeeID
$Employee1.FirstName
$Employee1.Title

$Employee1

#end





# Example 3: Get-Member

$Employee1 = New-Object -TypeName PSCustomObject

Add-Member -InputObject $Employee1 -MemberType NoteProperty -Name 'EmployeeID' -Value '1001'
Add-Member -InputObject $Employee1 -MemberType NoteProperty -Name 'FirstName' -Value 'Cristine'
Add-Member -InputObject $Employee1 -MemberType NoteProperty -Name 'Title' -Value 'Nurse'

Get-Member -InputObject $Employee1
$Employee1 | Get-Member # same as the above

$Employee1
#end






# Example 4: Creating Custom Objects 2

# Syntax:
$Employee2 = [PSCustomObject]@{
    Keys = "Value"
}

$Employee2 = [PSCustomObject]@{
    EmployeeID = "1002"
    FirstName = 'Bernadette'
    Title = 'Nurse'
}

$Employee2



# One Liner
$Employee3 = [PSCustomObject]@{EmployeeID = "1002"; FirstName = 'Cristiniee'; Title = 'Tiktoker'}

$Employee3
#end














# Summary: ArrayList

$mylist1 = [System.Collections.ArrayList]@()

$mylist1.GetType()


$mylist2 = New-Object -TypeName System.Collections.ArrayList

$mylist2.GetType()

$myList2.IsFixedSize

$mylist2.Add("Arraylist")
[void]$mylist2.Add("Arraylist")

$mylist2.AddRange(@("Sample1", "Sample2"))



$mylist2.Remove("Sample1")
$mylist2.RemoveAt(3)

$mylist2.RemoveRange(0,1)
$mylist2




# Summary: Array

Set-StrictMode -Version Latest
Set-StrictMode Off

$myArray = @( "A", "B", "C" )

$myArray.GetType()
$myArray.IsFixedSize
$myArray.Count
$myArray.Length

$myArray[2]

$myArray = $myArray + "D"

$myArray[3]

$myArray += "DE"

$myArray.RemoveAt(1) # not gonnna work; array is fixed.
$myArray = $myArray -ne "A"

$myArray

$myArray[3]
