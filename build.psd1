@{
    SourcePath        = "src/PowerShellTemplate.psd1"
    # Linux build agents are case sensitive
    CopyPaths         = "data", "../lib"
    PublicFilter      = "public/*.ps1"
    SourceDirectories = "classes", "private", "public"
}
