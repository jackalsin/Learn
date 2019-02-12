# 1. Topic: Module Development

<!-- TOC -->

- [1. Topic: Module Development](#1-topic-module-development)
  - [1.1. Writing a Windows PowerShell Module](#11-writing-a-windows-powershell-module)
    - [1.1.1. Understanding a Windows PowerShell Module](#111-understanding-a-windows-powershell-module)
      - [1.1.1.1. Module Components](#1111-module-components)
      - [1.1.1.2. Script Module](#1112-script-module)
      - [1.1.1.3. Binary Module](#1113-binary-module)
      - [1.1.1.4. Module Manifests](#1114-module-manifests)
      - [1.1.1.5. Storing and Installing Module](#1115-storing-and-installing-module)
    - [1.1.2. How to Write a PowerShell Script Module](#112-how-to-write-a-powershell-script-module)
      - [1.1.2.1. To create a basic PowerShell Module](#1121-to-create-a-basic-powershell-module)
    - [1.1.3. How to Write a PowerShell Binary Module](#113-how-to-write-a-powershell-binary-module)
    - [1.1.4. How to Write a PowerShell Module Manifest](#114-how-to-write-a-powershell-module-manifest)
      - [1.1.4.1. Creating a Module Manifest](#1141-creating-a-module-manifest)
        - [1.1.4.1.1. To create and use a module manifest](#11411-to-create-and-use-a-module-manifest)
      - [1.1.4.2. Test a Module Manifest](#1142-test-a-module-manifest)
      - [1.1.4.3. Reference Entry](#1143-reference-entry)
    - [1.1.5. Installing a PowerShell Module](#115-installing-a-powershell-module)
    - [1.1.6. Modifying the PSModulePath Installation Path](#116-modifying-the-psmodulepath-installation-path)
    - [1.1.7. Importing a PowerShell Module](#117-importing-a-powershell-module)
    - [1.1.8. Writing Help for Windows PowerShell Modules](#118-writing-help-for-windows-powershell-modules)
  - [1.2. Writing a Windows PowerShell Cmdlet](#12-writing-a-windows-powershell-cmdlet)
    - [1.2.1. Cmdlet Overview](#121-cmdlet-overview)
    - [1.2.2. Windows PowerShell Cmdlet Concepts](#122-windows-powershell-cmdlet-concepts)
      - [1.2.2.1. Cmdlet Development Guidelines](#1221-cmdlet-development-guidelines)
      - [1.2.2.2. Cmdlet Class Declaration](#1222-cmdlet-class-declaration)
      - [1.2.2.3. Approved Verbs for Windows PowerShell Commands](#1223-approved-verbs-for-windows-powershell-commands)
      - [1.2.2.4. Cmdlet Input Processing Methods](#1224-cmdlet-input-processing-methods)
      - [1.2.2.5. Cmdlet Parameters](#1225-cmdlet-parameters)
        - [1.2.2.5.1. Declaring Properties as Parameters](#12251-declaring-properties-as-parameters)
  - [1.3. Writing a Windows PowerShell Provider](#13-writing-a-windows-powershell-provider)
  - [1.4. Writing a Windows PowerShell Host Application](#14-writing-a-windows-powershell-host-application)
  - [1.5. Writing a PowerShell Formatting File](#15-writing-a-powershell-formatting-file)
  - [1.6. Writing Comment-Based Help Topics](#16-writing-comment-based-help-topics)
  - [1.7. Creating a Management OData Web Service](#17-creating-a-management-odata-web-service)
  - [1.8. Writing a Windows PowerShell Workflow](#18-writing-a-windows-powershell-workflow)
  - [1.9. Windows PowerShell Programmer's Guide](#19-windows-powershell-programmers-guide)
  - [1.10. Windows PowerShell Reference](#110-windows-powershell-reference)
  - [1.11. Reference](#111-reference)

<!-- /TOC -->

## 1.1. Writing a Windows PowerShell Module

### 1.1.1. Understanding a Windows PowerShell Module

#### 1.1.1.1. Module Components

A module is made up of four basic components:

1. Some sort of code file - usually either a PowerShell script or a managed cmdlet assembly.
2. libraries that code files need
3. A manifest file that describes the above files, as well as stores metadada such as author and versioning information..
4. A directory that contains all of the above content, and is located where PowerShell can reasonably find it.

#### 1.1.1.2. Script Module

A script module is a file (.psm1) that contains any valid Windows PowerShell code.

#### 1.1.1.3. Binary Module

A binary module is a .NET Framework assembly (.dll) that contains compiled code.

#### 1.1.1.4. Module Manifests

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

#### 1.1.1.5. Storing and Installing Module

1. Add to path
2. Using `Install-Module`

### 1.1.2. How to Write a PowerShell Script Module

#### 1.1.2.1. To create a basic PowerShell Module

- [Main.ps1](../1-Writing-a-Windows-Powershell-Module/Main.ps1)
- [Show-Calendar-Module.psm1](../1-Writing-a-Windows-Powershell-Module/Show-Calendar-Module.psm1)

You directly import module using relative path or the full path. Or you can import the module if it's under `%SystemRoot%/users/<user>/Documents/WindowsPowerShell/Modules/<moduleName>`

### 1.1.3. How to Write a PowerShell Binary Module

他妈的，没看懂

- [example](../2-How-to-Write-a-Powershell-Binary-Module/BinaryModuleExample/BinaryModuleExample/BinaryModuleExample.sln)

### 1.1.4. How to Write a PowerShell Module Manifest

#### 1.1.4.1. Creating a Module Manifest

##### 1.1.4.1.1. [To create and use a module manifest](https://docs.microsoft.com/en-us/powershell/developer/module/how-to-write-a-powershell-module-manifest#to-create-and-use-a-module-manifest)

1. Run `'@{ModuleVersion="1.0"}' > myModuleName.psd1`
1. Run `New-ModuleManifest myModuleName.psd1 -ModuleVersion "2.0" -Author "YourNameHere"`

#### 1.1.4.2. Test a Module Manifest

Run `Test-ModuleManifest myModuleName.psd1`

#### 1.1.4.3. [Reference Entry](https://docs.microsoft.com/en-us/powershell/developer/module/how-to-write-a-powershell-module-manifest#module-manifest-elements)

### 1.1.5. Installing a PowerShell Module

By default, the `PSModulePath` contains the following system and user module directories

- $PSHome\Modules (%Windir%\System32\WindowsPowerShell\v1.0\Modules)
 Warning
  - This location is reserved for modules that ship with Windows. Do not install modules to this location.
- $Home\Documents\WindowsPowerShell\Modules              (%UserProfile%\Documents\WindowsPowerShell\Modules)
- $Env:ProgramFiles\WindowsPowerShell\Modules (%ProgramFiles%\WindowsPowerShell\Modules)

[More Details](https://docs.microsoft.com/en-us/powershell/developer/module/installing-a-powershell-module)

### 1.1.6. Modifying the PSModulePath Installation Path

### 1.1.7. Importing a PowerShell Module

### 1.1.8. Writing Help for Windows PowerShell Modules

## 1.2. Writing a Windows PowerShell Cmdlet

### 1.2.1. Cmdlet Overview

### 1.2.2. Windows PowerShell Cmdlet Concepts

#### 1.2.2.1. Cmdlet Development Guidelines

#### 1.2.2.2. Cmdlet Class Declaration

#### 1.2.2.3. Approved Verbs for Windows PowerShell Commands

#### 1.2.2.4. Cmdlet Input Processing Methods

#### 1.2.2.5. Cmdlet Parameters

##### 1.2.2.5.1. Declaring Properties as Parameters

1. A parameter must be **explicitly** marked as public. Parameters that are not marked as public default to internal and will not be found by the Windows PowerShell runtime.

## 1.3. Writing a Windows PowerShell Provider

## 1.4. Writing a Windows PowerShell Host Application

## 1.5. Writing a PowerShell Formatting File

## 1.6. Writing Comment-Based Help Topics

## 1.7. Creating a Management OData Web Service

## 1.8. Writing a Windows PowerShell Workflow

## 1.9. Windows PowerShell Programmer's Guide

## 1.10. Windows PowerShell Reference




## 1.11. Reference

- [PowerShell/Developer](https://docs.microsoft.com/en-us/powershell/developer/module/understanding-a-windows-powershell-module)