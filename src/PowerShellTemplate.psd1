@{
    ModuleVersion           = "0.0.1"

    # Modules that must be imported into the global environment prior to importing this module
    RequiredModules         = @()

    # Functions to export. Populated by Optimize-Module during the build step.
    # For best performance, do not use wildcards and do not delete this entry!
    # Use an empty array if there is nothing to export.
    FunctionsToExport      = @()

    # Cmdlets to export.
    # For best performance, do not use wildcards and do not delete this entry!
    # Use an empty array if there is nothing to export.
    CmdletsToExport        = @()

    # Aliases to export.
    # For best performance, do not use wildcards and do not delete this entry!
    # Use an empty array if there is nothing to export.
    AliasesToExport        = @()

    # Variables to export.
    # For best performance, do not use wildcards and do not delete this entry!
    # Use an empty array if there is nothing to export.
    VariablesToExport      = @()


    # ID used to uniquely identify this module
    GUID                   = 'c3a4c064-f441-4b05-b08f-b65d2b20072c'
    Description            = 'A Template for PowerShell Modules'

    # The main script or binary module that is automatically loaded as part of this module
    RootModule             = 'PowerShellTemplate.psm1'

    # Common stuff for all our modules:
    CompanyName            = 'Copyright Holder Name'
    Author                 = 'DevOps Heroes'
    Copyright              = "Copyright 2022 Copyright Holder Name"

    # Minimum version of the Windows PowerShell engine required by this module
    PowerShellVersion      = '5.1'
    # Minimum version of the .NET Framework required by this module
    DotNetFrameworkVersion = '4.0'
    # Minimum version of the common language runtime (CLR) required by this module
    CLRVersion             = '4.0.30319'

    # PrivateData gets passed to the module at runtime, but is required for publishing with PowerShellGet and building with ModuleBuilder.
    PrivateData            = @{
        # Settings for publishing to the PowerShell gallery:
        PSData = @{
            # Pre-release suffix (like "Beta001"). Don't comment out because ModuleBuilder needs it
            Prerelease = ""
            # Optional release notes Don't comment out because ModuleBuilder needs it
            ReleaseNotes = '
            '
            # Optional tags for module discovery.
            # Tags = @()

            # A URL to the license for this module
            # LicenseUri = ''

            # A URL to the main website for this project.
            # ProjectUri = ''

            # A URL to an icon representing this module.
            # IconUri = ''
        }
    }
}
