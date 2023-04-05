@description('The location of the storage account')
@allowed(['westeurope', 'northeurope', 'eastus', 'westus'])
param location string = 'westeurope'

@description('The name of your solution')
@minLength(3)
@maxLength(24)
param solutionName string

var storageAccountName = '${solutionName}${uniqueString(resourceGroup().id)}'

resource storageAccount 'Microsoft.Storage/storageAccounts@2022-09-01' = {
  name: storageAccountName
  location: location
  sku: {
    name: 'Standard_LRS'
  }
  kind: 'StorageV2'
}

output storageAccountName string = storageAccountName
