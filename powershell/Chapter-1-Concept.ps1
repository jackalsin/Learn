# output of Powershell is an object, rather than text. It's purely OOD

Get-Service | Get-Member

# Output:

# TypeName: System.ServiceProcess.ServiceController

# Name                      MemberType    Definition
# ----                      ----------    ----------
# Name                      AliasProperty Name = ServiceName
# RequiredServices          AliasProperty RequiredServices = ServicesDependedOn
# Disposed                  Event         System.EventHandler Disposed(System.Object, System.EventArgs)
# Close                     Method        void Close()
# Continue                  Method        void Continue()
# CreateObjRef              Method        System.Runtime.Remoting.ObjRef CreateObjRef(type requestedType)
# Dispose                   Method        void Dispose(), void IDisposable.Dispose()
# Equals                    Method        bool Equals(System.Object obj)
# ExecuteCommand            Method        void ExecuteCommand(int command)
# GetHashCode               Method        int GetHashCode()
# GetLifetimeService        Method        System.Object GetLifetimeService()
# GetType                   Method        type GetType()
# InitializeLifetimeService Method        System.Object InitializeLifetimeService()
# Pause                     Method        void Pause()
# Refresh                   Method        void Refresh()
# Start                     Method        void Start(), void Start(string[] args)
# Stop                      Method        void Stop()
# WaitForStatus             Method        void WaitForStatus(System.ServiceProcess.ServiceControllerStatus desiredStatus), void WaitForStatus(System.ServiceProcess.ServiceControllerStatus desiredStatus, timespan time...
# CanPauseAndContinue       Property      bool CanPauseAndContinue {get;}
# CanShutdown               Property      bool CanShutdown {get;}
# CanStop                   Property      bool CanStop {get;}
# Container                 Property      System.ComponentModel.IContainer Container {get;}
# DependentServices         Property      System.ServiceProcess.ServiceController[] DependentServices {get;}
# DisplayName               Property      string DisplayName {get;set;}
# MachineName               Property      string MachineName {get;set;}
# ServiceHandle             Property      System.Runtime.InteropServices.SafeHandle ServiceHandle {get;}
# ServiceName               Property      string ServiceName {get;set;}
# ServicesDependedOn        Property      System.ServiceProcess.ServiceController[] ServicesDependedOn {get;}
# ServiceType               Property      System.ServiceProcess.ServiceType ServiceType {get;}
# Site                      Property      System.ComponentModel.ISite Site {get;set;}
# StartType                 Property      System.ServiceProcess.ServiceStartMode StartType {get;}
# Status                    Property      System.ServiceProcess.ServiceControllerStatus Status {get;}
# ToString                  ScriptMethod  System.Object ToString();

Write-Output "Cmdlets use verb-noun names to reduce command memorization"

# PowerShell has a recommended set of standard verbs. Nouns are less restricted, but always describe what the verb acts upon. 
# PowerShell has commands such as Get-Process, Stop-Process, Get-Service, and Stop-Service.

Get-Command -Verb Get

# CommandType     Name                            Definition
# -----------     ----                            ----------
# Cmdlet          Get-Acl                         Get-Acl [[-Path] <String[]>]...
# Cmdlet          Get-Alias                       Get-Alias [[-Name] <String[]...
# Cmdlet          Get-AuthenticodeSignature       Get-AuthenticodeSignature [-...
# Cmdlet          Get-ChildItem                   Get-ChildItem [[-Path] <Stri...

Get-Command -Noun Service

# CommandType     Name                            Definition
# -----------     ----                            ----------
# Cmdlet          Get-Service                     Get-Service [[-Name] <String...
# Cmdlet          New-Service                     New-Service [-Name] <String>...
# Cmdlet          Restart-Service                 Restart-Service [-Name] <Str...
# Cmdlet          Resume-Service                  Resume-Service [-Name] <Stri...
# Cmdlet          Set-Service                     Set-Service [-Name] <String>...

Get-Command -Name clear-host

CommandType     Name                                               Version    Source
-----------     ----                                               -------    ------
Function        Clear-Host


Get-Command -?

# NAME
#     Get-Command

# SYNTAX
#     Get-Command [[-ArgumentList] <Object[]>] [-Verb <string[]>] [-Noun <string[]>] [-Module <string[]>] [-FullyQualifiedModule <ModuleSpecification[]>] [-TotalCount <int>] [-Syntax] [-ShowCommandInfo] [-All]
#     [-ListImported] [-ParameterName <string[]>] [-ParameterType <PSTypeName[]>]  [<CommonParameters>]

#     Get-Command [[-Name] <string[]>] [[-ArgumentList] <Object[]>] [-Module <string[]>] [-FullyQualifiedModule <ModuleSpecification[]>] [-CommandType {Alias | Function | Filter | Cmdlet | ExternalScript | Application
#     | Script | Workflow | Configuration | All}] [-TotalCount <int>] [-Syntax] [-ShowCommandInfo] [-All] [-ListImported] [-ParameterName <string[]>] [-ParameterType <PSTypeName[]>]  [<CommonParameters>]


# ALIASES
#     gcm


# REMARKS
#     Get-Help cannot find the Help files for this cmdlet on this computer. It is displaying only partial help.
#         -- To download and install Help files for the module that includes this cmdlet, use Update-Help.
#         -- To view the Help topic for this cmdlet online, type: "Get-Help Get-Command -Online" or
#            go to https://go.microsoft.com/fwlink/?LinkID=113309.



# For example, the recommended name for a parameter that refers to a computer is "ComputerName", rather than Server, Host, System, Node, or some other common alternative. 
# Other important recommended parameter names are "Force", "Exclude", "Include", "PassThru", "Path", and "CaseSensitive".

