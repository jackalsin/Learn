# Topic: Module Development

- [Topic: Module Development](#topic-module-development)
  - [Writing a Windows PowerShell Module](#writing-a-windows-powershell-module)
    - [Understanding a Windows PowerShell Module](#understanding-a-windows-powershell-module)
      - [Module Components](#module-components)
      - [Script Module](#script-module)
      - [Binary Module](#binary-module)
      - [Module Manifests](#module-manifests)
      - [Storing and Installing Module](#storing-and-installing-module)
    - [How to Write a PowerShell Script Module](#how-to-write-a-powershell-script-module)
      - [To create a basic PowerShell Module](#to-create-a-basic-powershell-module)
    - [How to Write a PowerShell Binary Module](#how-to-write-a-powershell-binary-module)
    - [How to Write a PowerShell Module Manifest](#how-to-write-a-powershell-module-manifest)
      - [Creating a Module Manifest](#creating-a-module-manifest)
        - [To create and use a module manifest](#to-create-and-use-a-module-manifest)
      - [Test a Module Manifest](#test-a-module-manifest)
      - [Reference Entry](#reference-entry)
    - [Installing a PowerShell Module](#installing-a-powershell-module)
    - [Modifying the PSModulePath Installation Path](#modifying-the-psmodulepath-installation-path)
    - [Importing a PowerShell Module](#importing-a-powershell-module)
    - [Writing Help for Windows PowerShell Modules](#writing-help-for-windows-powershell-modules)
  - [Writing a Windows PowerShell Cmdlet](#writing-a-windows-powershell-cmdlet)
  - [Writing a Windows PowerShell Provider](#writing-a-windows-powershell-provider)
  - [Writing a Windows PowerShell Host Application](#writing-a-windows-powershell-host-application)
  - [Writing a PowerShell Formatting File](#writing-a-powershell-formatting-file)
  - [Writing Comment-Based Help Topics](#writing-comment-based-help-topics)
  - [Creating a Management OData Web Service](#creating-a-management-odata-web-service)
  - [Writing a Windows PowerShell Workflow](#writing-a-windows-powershell-workflow)
  - [Windows PowerShell Programmer's Guide](#windows-powershell-programmers-guide)
  - [Windows PowerShell Reference](#windows-powershell-reference)
  - [Reference](#reference)

## Writing a Windows PowerShell Module

### Understanding a Windows PowerShell Module

#### Module Components

A module is made up of four basic components:

1. Some sort of code file - usually either a PowerShell script or a managed cmdlet assembly.
1. libraries that code files need
1. A manifest file that describes the above files, as well as stores metadada such as author and versioning information..
1. A directory that contains all of the above content, and is located where PowerShell can reasonably find it.

#### Script Module

A script module is a file (.psm1) that contains any valid Windows PowerShell code.

#### Binary Module

A binary module is a .NET Framework assembly (.dll) that contains compiled code.

#### Module Manifests

A module manifest is a `.psd1` file that contains a hash table. The keys and values in the hash table do the following things:

1. Describe the contents and attributes of the module.
1. Define the prerequisites.
1. Determine how the components are processed.
1. Manifests are **not** required for a module. Modules can reference script files (.ps1), script module files (.psm1), manifest files (.psd1), formatting and type files (.ps1xml), cmdlet and provider assemblies (.dll), resource files, Help files, localization files, or any other type of file or resource that is bundled as part of the module. For an internationalized script, the module folder also contains a set of message catalog files. If you add a manifest file to the module folder, you can reference the multiple files as a single unit by referencing the manifest.

The manifest itself describes the following categories of information:

1. Metadata about the module, such as the module version number, the author, and the description.
1. Prerequisites needed to import the module, such as the Windows PowerShell version, the common language runtime (CLR) version, and the required modules.
1. Processing directives, such as the scripts, formats, and types to process.
1. Restrictions on the members of the module to export, such as the aliases, functions, variables, and cmdlets to export.

#### Storing and Installing Module

1. Add to path
2. Using `Install-Module`

### How to Write a PowerShell Script Module

#### To create a basic PowerShell Module

- [Main.ps1](../1-Writing-a-Windows-Powershell-Module/Main.ps1)
- [Show-Calendar-Module.psm1](../1-Writing-a-Windows-Powershell-Module/Show-Calendar-Module.psm1)

You directly import module using relative path or the full path. Or you can import the module if it's under `%SystemRoot%/users/<user>/Documents/WindowsPowerShell/Modules/<moduleName>`

### How to Write a PowerShell Binary Module

他妈的，没看懂

- [example](../2-How-to-Write-a-Powershell-Binary-Module/BinaryModuleExample/BinaryModuleExample/BinaryModuleExample.sln)

### How to Write a PowerShell Module Manifest

#### Creating a Module Manifest

##### [To create and use a module manifest](https://docs.microsoft.com/en-us/powershell/developer/module/how-to-write-a-powershell-module-manifest#to-create-and-use-a-module-manifest)

1. Run `'@{ModuleVersion="1.0"}' > myModuleName.psd1`
1. Run `New-ModuleManifest myModuleName.psd1 -ModuleVersion "2.0" -Author "YourNameHere"`

#### Test a Module Manifest

Run `Test-ModuleManifest myModuleName.psd1`

#### [Reference Entry](https://docs.microsoft.com/en-us/powershell/developer/module/how-to-write-a-powershell-module-manifest#module-manifest-elements)

### Installing a PowerShell Module

By default, the `PSModulePath` contains the following system and user module directories

- $PSHome\Modules (%Windir%\System32\WindowsPowerShell\v1.0\Modules)
 Warning
  - This location is reserved for modules that ship with Windows. Do not install modules to this location.
- $Home\Documents\WindowsPowerShell\Modules              (%UserProfile%\Documents\WindowsPowerShell\Modules)
- $Env:ProgramFiles\WindowsPowerShell\Modules (%ProgramFiles%\WindowsPowerShell\Modules)

[More Details](https://docs.microsoft.com/en-us/powershell/developer/module/installing-a-powershell-module)

### Modifying the PSModulePath Installation Path

### Importing a PowerShell Module

### Writing Help for Windows PowerShell Modules


## Writing a Windows PowerShell Cmdlet

## Writing a Windows PowerShell Provider

## Writing a Windows PowerShell Host Application

## Writing a PowerShell Formatting File

## Writing Comment-Based Help Topics

## Creating a Management OData Web Service

## Writing a Windows PowerShell Workflow

## Windows PowerShell Programmer's Guide

## Windows PowerShell Reference




## Reference

- [PowerShell/Developer](https://docs.microsoft.com/en-us/powershell/developer/module/understanding-a-windows-powershell-module)