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




# Example 10: Add values to hashtable 1


$myHashTable = @{
    key1 = 100
    apple = 2.34
    name = "Cristine"
    key2 = 200
    name2 = "Cristine"
    key3 = $true
}

$myHashTable.Add('','') # syntax

$myHashTable.Add('key4','test to add function')

$myHashTable

#end









Set-StrictMode -Version Latest
Set-StrictMode Off

$myArray = @( "A", "B", "C" )

$myArray = $myArray + "D"

$myArray += "DE"

$myArray

$myArray[3]
