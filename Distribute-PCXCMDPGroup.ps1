# use below line if you alrady added the module to powershell module folder (C:\Program Files\WindowsPowerShell\Modules), if not contiunue
# Import-Module ContentDistribution

#Import from current directory
Import-Module .\ContentDistribution

DistributeToDPGroup -applicationName "Your_Applicatoin_Name" -distributionPointGroupName "Your_DP_Group_Name"

#DistributeToDPGroup -applicationName @("App1", "App2") -distributionPointGroupName @("DPGroup1", "DPGroup2")

