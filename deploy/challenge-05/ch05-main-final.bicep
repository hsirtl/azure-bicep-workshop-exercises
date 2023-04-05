@description('The location of the resources')
@allowed(['westeurope', 'northeurope', 'eastus', 'westus'])
param location string = 'westeurope'

@description('The name of your solution')
@minLength(3)
@maxLength(24)
param solutionName string

@allowed([
  'dev'
  'test'
  'prod'
])
param environmentType string = 'dev'

var storageAccountName = '${solutionName}${uniqueString(resourceGroup().id)}'
var storageAccountSkuName = (environmentType == 'prod') ? 'Standard_GRS' : 'Standard_LRS'

module stgModule './modules/storageAccount.bicep' = {
  name: 'storageDeploy'
  params: {
    storageAccountName: storageAccountName
    storageAccountSkuName: storageAccountSkuName
    location: location
  }
}

output storageAccountName string = stgModule.outputs.storageAccountName
