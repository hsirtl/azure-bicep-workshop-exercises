@description('The location of the resources')
@allowed(['westeurope', 'northeurope', 'eastus', 'westus'])
param location string = 'westeurope'

@description('The name of your solution')
@minLength(3)
@maxLength(24)
param solutionName string

var storageAccountName = '${solutionName}${uniqueString(resourceGroup().id)}'

module stgModule './modules/storageAccount.bicep' = {
  name: 'storageDeploy'
  params: {
    storageAccountName: storageAccountName
    location: location
  }
}

output storageAccountName string = stgModule.outputs.storageAccountName
