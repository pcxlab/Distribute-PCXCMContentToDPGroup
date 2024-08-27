@{
    # Module manifest for ContentDistribution

    # Script module or binary module file associated with this manifest.
    RootModule = 'ContentDistribution.psm1'

    # Version number of this module.
    ModuleVersion = '1.0.0'

    # Supported PSEditions
    CompatiblePSEditions = @('Core', 'Desktop')

    # Author of this module
    Author = 'HarshiBharath'

    # Company or vendor of this module
    CompanyName = 'PCXLab'

    # Description of the functionality provided by this module
    Description = 'A module for distributing applications to distribution point groups in SCCM.'

    # Functions to export from this module
    FunctionsToExport = @('DistributeToDPGroup')

    # Modules that must be imported into the global environment prior to importing this module
    #RequiredModules = @('ConfigurationManager')

    # Private data to pass to the root module
    PrivateData = @{
        PSData = @{
            Tags = @('SCCM', 'Content Distribution', 'Automation')
            LicenseUri = ''
            ProjectUri = ''
            IconUri = ''
        }
    }
}
