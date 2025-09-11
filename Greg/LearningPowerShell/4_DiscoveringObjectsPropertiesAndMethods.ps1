
# Chapter 3 - Discovering objects, properties, and methods

<#

PowerShell is an object-oriented scripting language.

It represents data and system states using structured objects
derived from .NET classes defined in the .NET Framework.

By leveraging the .NET Framework,
PowerShell offers access to various system capabilities,
including file system, registry, and Windows Management Instrumentation (WMI) classes.

PowerShell also has access to the .NET Framework class library,
which contains a vast collection of classes that you can use to develop robust PowerShell scripts.




In PowerShell, each item or state is an instance of an object that can be explored and manipulated.

The Get-Member cmdlet is one of the primary tools provided by PowerShell for object discovery,
which reveals an object's characteristics.

This chapter explores how PowerShell leverages objects
and how you can discover and manipulate these objects
to streamline your scripts and manage your systems more efficiently.

#>
#end

# Prerequisites

<#

To follow the specific examples in this chapter,
ensure that your lab environment computer is part of your lab environment Active Directory domain.

You must also install the Active Directory PowerShell module
bundled with the Windows Remote Server Administration Tools (RSAT).

If you're using Windows 10 build 1809 or later, including Windows 11, y
ou can install RSAT as a Windows feature.

 Note : Active Directory is unsupported for Windows Home editions.

For information about installing RSAT, see Windows Management modules.

 https://learn.microsoft.com/en-us/powershell/scripting/whats-new/module-compatibility?view=powershell-7.5#windows-management-modules

For older versions of Windows, see RSAT for Windows.

 https://learn.microsoft.com/en-us/troubleshoot/windows-server/system-management-components/remote-server-administration-tools



#>
#end


# Get-Member

<#

Get-Member provides insight into the objects, properties, and methods
associated with PowerShell commands.

You can pipe any PowerShell command that produces object-based output to Get-Member.

When you pipe the output of a command to Get-Member,
it reveals the structure of the object returned by the command,
detailing its properties and methods.

    Properties: The attributes of an object.
    Methods: The actions you can perform on an object

To illustrate this concept, consider a driver's license as an analogy.
Like any object, a driver's license has properties,
such as eye color, which typically includes blue and brown values.

In contrast, methods represent actions you can perform on the object.
For instance, Revoke is a method that the Department of Motor Vehicles can perform on a driver's license.

#>


# Properties

# Example 1: Properties - Retrieving Details On A Service

Get-Service -Name w32time

<#

To retrieve details about the Windows Time service on your system using PowerShell, use the Get-Service cmdlet.

The results include the Status, Name, and DisplayName properties.

The Status property indicates that the service is Running.
The value for the Name property is w32time,
and the value for the DisplayName property is Windows Time.

Output
Status   Name               DisplayName
------   ----               -----------
Running  w32time            Windows Time

#>


# Example 2: Properties - Retrieivng properties and methods of a service

Get-Service -Name w32time | Get-Member

<#

To list all available properties and methods for Get-Service, pipe it to Get-Member.

The results show the first line contains one piece of significant information.

TypeName identifies the type of object returned,
which in this example is a System.ServiceProcess.ServiceController object.

This name is often abbreviated to the last part of the TypeName, such as ServiceController, in this example.






TypeName: System.ServiceProcess.ServiceController

Name                      MemberType    Definition
----                      ----------    ----------
Name                      AliasProperty Name = ServiceName
RequiredServices          AliasProperty RequiredServices = ServicesDepend...
Disposed                  Event         System.EventHandler Disposed(Syst...
Close                     Method        void Close()
Continue                  Method        void Continue()
CreateObjRef              Method        System.Runtime.Remoting.ObjRef Cr...
Dispose                   Method        void Dispose(), void IDisposable....
Equals                    Method        bool Equals(System.Object obj)
ExecuteCommand            Method        void ExecuteCommand(int command)
GetHashCode               Method        int GetHashCode()
GetLifetimeService        Method        System.Object GetLifetimeService()
GetType                   Method        type GetType()
InitializeLifetimeService Method        System.Object InitializeLifetimeS...
Pause                     Method        void Pause()
Refresh                   Method        void Refresh()
Start                     Method        void Start(), void Start(string[]...
Stop                      Method        void Stop()
WaitForStatus             Method        void WaitForStatus(System.Service...
CanPauseAndContinue       Property      bool CanPauseAndContinue {get;}
CanShutdown               Property      bool CanShutdown {get;}
CanStop                   Property      bool CanStop {get;}
Container                 Property      System.ComponentModel.IContainer ...
DependentServices         Property      System.ServiceProcess.ServiceCont...
DisplayName               Property      string DisplayName {get;set;}
MachineName               Property      string MachineName {get;set;}
ServiceHandle             Property      System.Runtime.InteropServices.Sa...
ServiceName               Property      string ServiceName {get;set;}
ServicesDependedOn        Property      System.ServiceProcess.ServiceCont...
ServiceType               Property      System.ServiceProcess.ServiceType...
Site                      Property      System.ComponentModel.ISite Site ...
StartType                 Property      System.ServiceProcess.ServiceStar...
Status                    Property      System.ServiceProcess.ServiceCont...
ToString                  ScriptMethod  System.Object ToString();

#>
#end



# Example 3: Properties - Selecting all properties of a service. Plus, Table and List

Get-Service -Name w32time | Select-Object -Property *

Get-Service -Name w32time | Select-Object -Property * | Format-Table

<#

Notice when you piped Get-Service to Get-Member,
there are more properties than are displayed by default.

Although these additional properties aren't shown by default,
you can select them by piping to Select-Object and using the Property parameter.

The following example selects all properties by piping the results of Get-Service to Select-Object
and specifying the * wildcard character as the value for the Property parame


By default, PowerShell returns four properties as a table and five or more as a list.

However, some commands apply custom formatting to override the default number of properties displayed in a table.

You can use Format-Table and Format-List to override these defaults manually.

Name                : w32time
RequiredServices    : {}
CanPauseAndContinue : False
CanShutdown         : True
CanStop             : True
DisplayName         : Windows Time
DependentServices   : {}
MachineName         : .
ServiceName         : w32time
ServicesDependedOn  : {}
ServiceHandle       :
Status              : Running
ServiceType         : Win32OwnProcess, Win32ShareProcess
StartType           : Manual
Site                :
Container           :

#>
#end



# Example 4: Properties - Using a comma separated list

Get-Service -Name w32time |
    Select-Object -Property Status, Name, DisplayName, ServiceType


<#

Status Name    DisplayName                         ServiceType
 ------ ----    -----------                         -----------
Running w32time Windows Time Win32OwnProcess, Win32ShareProcess


Specific properties can also be selected using a comma-separated list as the value of the Property parameter.

#>
#end





# Example 5:

Get-Service -Name w32time |
    Select-Object -Property Status, DisplayName, Can*

<#

You can use wildcard characters when specifying property names with Select-Object.

In the following example, use Can* as one of the values for the Property parameter to return all the properties that start with Can. These include CanPauseAndContinue, CanShutdown, and CanStop.

#>