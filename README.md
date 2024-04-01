# PowerShellTemplate

This is an example module, following some good practices.

## How to use this Template

For the sake of examples below, we have set `$projects` to the root of our projects folder, and  cloned this repository to `$projects\PowerShellTemplate`, and we are creating a module named "TestModule" at the path `$projects\TestModule`.

### Creating a New Module

Depending on the availability of `dotnet`, you can either use `dotnet new` or perform a naive clone of the directory (replacing all instances of 'CloneModule' with your module name, and editing the GUIDs and other fields in the PSD1 appropriately).

The blank template accepts several options.

|    Option     |                Description                |
| ------------- | ----------------------------------------- |
| --name        | The name of the new module                |
| --author      | Module author, in the PSD1                |
| --company     | Company and Copyright fields, in the PSD1 |
| --description | Description field, in the PSD1            |
| --output      | Path to output. Defaults to $PWD          |

If you have `dotnet` installed, you can run the following code:

```PowerShell
dotnet new --install $projects\PowerShellTemplate\
dotnet new PSModule --name TestModule --author $env:UserName --company $CompanyName --description $DescriptionOfModule --output $projects\TestModule
```

> Please note that dotnet is case sensitive, so `--Output` won't work, you **must** specify `--output`

If you don't have the `dotnet` command available, you should install the dotnet SDK

### Populating the Module with Functions

We use ModuleBuilder, and it's `Build-Module` command creates a single .psm1 file from all the .ps1 files that aren't specified in CopyDirectories.

By convention, you would create a `Verb-Noun.ps1` file in a `public` folder for each public function, and a `VerbNoun.ps1` in the `private` folder for supporting functions you don't want to expose.

### Classes and Initialization

Classes, enums, and any module initialization code can be placed in a `classes` folder. We name these with a digit-prefix (e.g. `00-init.ps1`, `10-ClassDependency.ps1`, `20-SampleClass.ps1`, etc), to control the order in which they are added to the top of the .psm1 module file.

## Writing PowerShell Modules

### Guidelines

For some best practices regarding PowerShell, we recommend reading the [PoshCode Practice and Style guide](https://github.com/PoshCode/PowerShellPracticeAndStyle). Though not complete, it has a good selection of recommendations. Your company might want more specific coding standards, but this repo starts with some basics:

Formatting:

- Use [One True Brace Style](https://en.wikipedia.org/wiki/Indent_style#Variant:_1TBS_.28OTBS.29)
- Use [Pascal Casing](https://en.wikipedia.org/wiki/PascalCase) unless PowerShell has a previously established case, and with the exception of environment variables, which should be ALL CAPS snake case (e.g. $env:DOTNET_ROOT)
- Use 4-space indentation
- If there are more than three parameters, named parameters should be used instead of positional parameters
- Aliases must not be used, instead expanded to the full command name
- Functions must have valid comment-based help, including (at minimum) a synopsis, parameter help, and at least one working example

Structure:

- Ensure all Public functions have valid names (i.e. using Verb-Noun format with a [supported Verb](https://msdn.microsoft.com/en-us/library/ms714428(v=vs.85).aspx))
- Functions should support pipelining where practical
- Functions must use `[CmdletBinding()]` to enable the use of common parameters and `-?` for help.
- Functions should specify their output object type with `[OutputType()]`

### Folder Structure Of a working module

```
\--.vscode
   |--settings.json             # Configuration for VSCode (including PowerShell code formatting and script analyzer settings)
   |--tasks.json                # Common PowerShell related tasks
|--README.md                    # A readme, containing useful information about the module
|--.build.ps1                   # The module build script
|--RequiredModules.psd1         # A list of modules required to build and test this module
|--ScriptAnalyzerSettings.psd1  # Settings for ScriptAnalyzer
\--ModuleFolder
   |--classes                   # OPTIONAL: Can contain class / enum definition ps1 files
   |--data                      # OPTIONAL: Can contain data used by the module (copied into the output)
   |--private                   # OPTIONAL: Contains private function definitions
   |--public                    # Contains public function definitions
   |--tests
      |--classes                # OPTIONAL: Tests for items defined in classes folder
      |--data                   # OPTIONAL: Can contain data used by tests
      |--private                # OPTIONAL: Tests for private functions
      |--public                 # Tests for public functions
      \--ModuleName.Test.ps1    # Module level tests, including ScriptAnalyzer
   |--ModuleName.psd1           # PSD1 containing module data
```

## Writing Tests for PowerShell Modules

You should use Pester for PowerShell unit-testing.

At a minimum, each function must have a test invocation for each ParameterSet and each .EXAMPLE from the help, plus the build should run the shared ScriptAnalyzer tests.

## Building PowerShell Modules

We use `Invoke-Build` to build our modules, to ensure we can reproduce the build locally on our laptops the same as in our CI/CD environment

We keep shared build tasks defined in a [Tasks](/PoshCode/Tasks) repository, so all our module builds are basically identical.

To build locally, you'll need to have that repository checked out adjacent to this one. Then, you can just switch to this folder and run: `Invoke-Build`

## Testing PowerShell Modules

The default build will include running all the tests. If you want to skip the tests, you can run `Invoke-Build BuildModule`, and if you want to re-run the tests, you can run `Invoke-Build TestModule`.
