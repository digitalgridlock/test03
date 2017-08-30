<#
# File: deploy.ps1
#
# Description:
# PowerShell script to run Azure Resource Manager deployment
#
# Version: 0.1
# Last Udpate:
#>

Param(
    [Parameter(
        Mandatory=$True,
        HelpMessage="Please enter the Azure Resource Group Name.",
        Position=1)]
    [string]$rgName,

    [ValidateSet("westus","eastus","eastus2")]
    [Parameter(
        Mandatory=$True,
        HelpMessage="Please enter the Azure region: eastus, eastus2, westus",
        Position=2)]
    [string]$location
)

function Log ([string]$message) {
    $now = Get-Date
    Write-Host $now.ToShortTimeString() $now.ToShortDateString() $message -Separator ","
}

## Uncomment if needed
#Login-AzureRmAccount

# Setup Deploymenet Variables
#$rgName = ""
#$location = ""


## Run the deployments ##
Log("Running Deployment")

Log("Deploying Resource Group")
New-AzureRmResourceGroup -Name $rgName -Location $location -Force

Log("Deploying Resources")
New-AzureRmResourceGroupDeployment -ResourceGroupName $rgName -TemplateFile .\azure.deployment.with-repo.json -TemplateParameterFile .\azure.deployment.parameters.json

Log("Deployment Complete")