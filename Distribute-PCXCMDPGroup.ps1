﻿# use below line if you alrady added the module to powershell module folder (C:\Program Files\WindowsPowerShell\Modules), if not contiunue
# Import-Module ContentDistribution

#Set current directory Script Root
Set-Location $PSScriptRoot

#Import from current directory
#We can also use directly name if we copy to module directly of the machine 
Import-Module .\ContentDistribution

DistributeToDPGroup -applicationName "Your_Applicatoin_Name" -distributionPointGroupName "Your_DP_Group_Name"

#DistributeToDPGroup -applicationName @("App1", "App2") -distributionPointGroupName @("DPGroup1", "DPGroup2")

