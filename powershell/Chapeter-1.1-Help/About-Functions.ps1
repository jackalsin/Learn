function Start-PSAdmin 
{
<#
.Synopsis
Start-PSAdmin starts a powershell with Admin previledge

.Description
Start-PSAdmin starts a powershell with Admin previledge

The valid help keywords can be found here. https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_comment_based_help?view=powershell-6#comment-based-help-keywords

.PARAMETER Size
Size is a dummy parameter. It will show in -Full

#>
    Param($Size)
    Write-Output $Size
    Start-Process PowerShell -Verb RunAs
}

# Start-PSAdmin

# source a powershell script
# . ./<the_file_you_want_source>

# There are 3 types of parameter you can add to the function
# 1. Positional Parameter: https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_functions?view=powershell-6#positional-parameters
# 2. Switch Parameter 就是一个flag, ls -l : https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_functions?view=powershell-6#switch-parameters
# 3. Named Parameter (example: Get-SmallFiles -Size 50): https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_functions?view=powershell-6#switch-parameters

function Add-Extension
{
param ([string]$Name,[string]$Extension = "txt")
$name = $name + "." + $extension
$name

<#
.SYNOPSIS

Adds a file name extension to a supplied name.

.DESCRIPTION

Adds a file name extension to a supplied name.
Takes any strings for the file name or extension.

.PARAMETER Name
Specifies the file name.

.PARAMETER Extension
Specifies the extension. "Txt" is the default.

.INPUTS

None. You cannot pipe objects to Add-Extension.

.OUTPUTS

System.String. Add-Extension returns a string with the extension
or file name.

.EXAMPLE

C:\PS> extension -name "File"
File.txt

.EXAMPLE

C:\PS> extension -name "File" -extension "doc"
File.doc

.EXAMPLE

C:\PS> extension "File" "doc"
File.doc

.LINK

http://www.fabrikam.com/extension.html

.LINK

Set-Item
#>
}