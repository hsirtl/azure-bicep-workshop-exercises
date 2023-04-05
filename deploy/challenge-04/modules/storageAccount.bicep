@description('The location of the storage account')
param location string

@description('The name of your storage account')
@minLength(3)
@maxLength(48)
param storageAccountName string

resource storageAccount 'Microsoft.Storage/storageAccounts@2022-09-01' = {
  name: storageAccountName
  location: location
  sku: {
    name: 'Standard_LRS'
  }
  kind: 'StorageV2'
}

output storageAccountName string = storageAccountName
