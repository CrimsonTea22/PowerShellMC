
Get-Service

#Contents:

<#

1. Description
2. Examples



#>

#Description

<#
https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.management/get-service?view=powershell-7.5


The Get-Service cmdlet gets objects that represent the services on a computer,
including running and stopped services.

By default, when Get-Service is run without parameters, all the local computer's services are returned.

You can direct this cmdlet to get only particular services by specifying the service name
or the display name of the services, or you can pipe service objects to this cmdlet.







NOTE:

Typically, Get-Service returns information about services and not driver.
However, if you specify the name of a driver, Get-Service returns information about the driver.

Enumeration doesn't include device driver services
When a wildcard is specified, the cmdlet only returns Windows services

If you specify the Name or DisplayName that is an exact match to a device service name,
then the device instance is returned





#>
#end


# Example 1: Get all services on the computer

Get-Service

<#

This example gets all of the services on the computer.

It behaves as though you typed Get-Service *.

The default display shows the status, service name, and display name of each service.

#>
#end


# Example 2: Get services that begin with a search string

Get-Service "wmi*"

<#

This example retrieves services with service names that begin with WMI (Windows Management Instrumentation).

#>
#end


# Example 3: Display services that include a search string

Get-Service -DisplayName "*network*"

<#

This example displays services with a display name that includes the word network.

Searching the display name finds network-related services
even when the service name doesn't include Net, such as xmlprov, the Network Provisioning Service.

#>
#end


# Example 4: Get services that begin with a search string and an exclusion

Get-Service -Name "win*" -Exclude "WinRM"

<#

This example only gets the services with service names that begin with win, except for the WinRM service.

#>
#end



# Example 5: Display services that are currently active

Get-Service | Where-Object {$_.Status -eq "Running"}

Get-Service | Get-Member

<#

This example displays only the services with a status of Running.

Get-Service gets all the services on the computer and sends the objects down the pipeline.
The Where-Object cmdlet, selects only the services with a Status property that equals Running.

Status is only one property of service objects.
To see all of the properties, type Get-Service | Get-Member.


NOTE:

When you sort in ascending order by status value, Stopped services appear before Running services.

The Status property of a service is an enumerated value in which the names of the statuses
represent integer values.

The sort is based on the integer value, not the name.

Running appears before Stopped because Stopped has a value of 1, and Running has a value of 4.

For more information, see ServiceControllerStatus.

https://learn.microsoft.com/en-us/dotnet/api/system.serviceprocess.servicecontrollerstatus?view=net-9.0-pp

#>
# end



# Example 6: List the services on the computer that have dependent services

Get-Service | Where-Object {$_.DependentServices} |
    Format-List -Property Name, DependentServices, @{
        Label="NoOfDependentServices"
        Expression={$_.DependentServices.Count}
    }

<#

This example gets services that have dependent services.

The Get-Service cmdlet gets all the services on the computer and sends the objects down the pipeline.

The Where-Object cmdlet selects the services whose DependentServices property isn't null.


The results are sent down the pipeline to the Format-List cmdlet.

The Property parameter displays the name of the service, the name of the dependent services,
and a calculated property that displays the number of dependent services for each service.

#>
#end




# Example 7: Sort services by property value

Get-Service "s*" | Sort-Object Status

Get-Service "s*" | Sort-Object Status -Descending


<#

This example shows that when you sort services in ascending order
by the value of their Status property, stopped services appear before running services.

This happens because the value of Status is an enumeration,
in which Stopped has a value of 1, and Running has a value of 4.

For more information, see ServiceControllerStatus.

https://learn.microsoft.com/en-us/dotnet/api/system.serviceprocess.servicecontrollerstatus?view=net-9.0-pp

To list running services first, use the Descending parameter of the Sort-Object cmdlet.

#>
#end



# Example 8: Get the dependent services of a service

Get-Service "WinRM" -RequiredServices

<#

This example gets the services that the WinRM service requires.
The value of the service's ServicesDependedOn property is returned.



Parameter: -RequiredServices

Indicates that this cmdlet gets only the services that this service requires.
This parameter gets the value of the ServicesDependedOn property of the service.

#>
#end



# Example 9: Get a service through the pipeline operator

"WinRM" | Get-Service

<#

This example gets the WinRM service on the local computer.

The service name string, enclosed in quotation marks, is sent down the pipeline to Get-Service.

#>
