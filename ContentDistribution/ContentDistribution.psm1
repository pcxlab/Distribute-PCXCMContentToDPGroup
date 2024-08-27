<#
.SYNOPSIS
    Distributes one or more applications to one or more distribution point groups.
.DESCRIPTION
    This function accepts one or more application names and one or more distribution point group names.
    It checks if the applications and distribution point groups exist, and then distributes each application
    to each distribution point group.
.PARAMETER applicationName
    The name(s) of the application(s) to be distributed. Accepts a single application name or an array of application names.
.PARAMETER distributionPointGroupName
    The name(s) of the distribution point group(s) where the application(s) will be distributed. Accepts a single distribution point group name or an array of group names.
.EXAMPLE
    DistributeToDPGroup -applicationName "App1" -distributionPointGroupName "DPGroup1"
    Distributes the application "App1" to the distribution point group "DPGroup1".
.EXAMPLE
    DistributeToDPGroup -applicationName @("App1", "App2") -distributionPointGroupName "DPGroup1"
    Distributes both "App1" and "App2" to the distribution point group "DPGroup1".
.EXAMPLE
    DistributeToDPGroup -applicationName "App1" -distributionPointGroupName @("DPGroup1", "DPGroup2")
    Distributes the application "App1" to both "DPGroup1" and "DPGroup2".
.EXAMPLE
    DistributeToDPGroup -applicationName @("App1", "App2") -distributionPointGroupName @("DPGroup1", "DPGroup2")
    Distributes both "App1" and "App2" to both "DPGroup1" and "DPGroup2".
#>
function DistributeToDPGroup {
    param(
        [Parameter(Mandatory=$true)]
        [ValidateNotNullOrEmpty()]
        [string[]]$applicationName,  # Accepts single or multiple applications
        
        [Parameter(Mandatory=$true)]
        [ValidateNotNullOrEmpty()]
        [string[]]$distributionPointGroupName  # Accepts single or multiple distribution point groups
    )

    foreach ($app in $applicationName) {
        # Get the application object
        $application = Get-CMApplication -Name $app -Fast

        if ($application -eq $null) {
            Write-Host "Application '$app' not found." -ForegroundColor Red
            continue  # Skip to the next application if not found
        }

        foreach ($dpGroup in $distributionPointGroupName) {
            # Get the distribution point group object
            $distributionPointGroup = Get-CMDistributionPointGroup -Name $dpGroup

            if ($distributionPointGroup -eq $null) {
                Write-Host "Distribution point group '$dpGroup' not found." -ForegroundColor Red
                continue  # Skip to the next DP group if not found
            }

            try {
                Start-CMContentDistribution -ApplicationName $app -DistributionPointGroupName $dpGroup
                Write-Host "Application '$app' has been distributed to distribution point group '$dpGroup'." -ForegroundColor Green
            } catch {
                Write-Host "Failed to start content distribution for application '$app' to distribution point group '$dpGroup': `n$_" -ForegroundColor Red
            }
        }
    }
}
