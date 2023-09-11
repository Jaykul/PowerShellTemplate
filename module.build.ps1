#requires -Module InvokeBuild
[CmdletBinding()]
param(
    [Alias("Force")]
    [switch]$Clean
)

# Hey team: this should be improved each time you touch it until we get to 0.85
$Script:RequiredCodeCoverage = 0.75

## Always define the default task first
if ($Clean) {
    Add-BuildTask CleanBuild Build, Test
}
Add-BuildTask Module Build, Test

## This InvokeBuild configuration script depends on a shared "InvokeBuildTasks" repository being present
if (Test-Path "$PSScriptRoot/InvokeBuildTasks") {
    . $PSScriptRoot/InvokeBuildTasks/InitializeModuleBuild.ps1
} else {
    . $PSScriptRoot/../InvokeBuildTasks/InitializeModuleBuild.ps1
}
