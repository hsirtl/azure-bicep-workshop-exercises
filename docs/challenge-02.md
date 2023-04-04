# Challenge 2

## Create and deploy your first Bicep config

### Open Visual Studio Code

1. Create a new directory for your Bicep content
1. Open that directory in VS Code

### Create a new Bicep file

1. Create a new file called ```main.bicep```

### Create a new Bicep resource

1. Start typing ```resource storageAccount '```  
  If the Bicep extension is properly installed, this should bring up suggestions for the resource type and the API version.
1. Select ```'Microsoft.Storage/storageAccounts@2022-09-01'```  
  This will insert the resource type and the API version.
1. Continue to type ```=```  
  This should make the Bicep extension to offer you to add required properties.
1. Fill in values for the required properties (choose a globally unique value for the ```name```-property). Note that the Bicep extension helps you finding valid values for the properties.

Your Bicep file should now look like this:

```bicep
resource storageAccount 'Microsoft.Storage/storageAccounts@2022-09-01' = {
  name: 'mystorageq1w2e3'
  location: 'westeurope'
  sku: {
    name: 'Standard_LRS'
  }
  kind: 'StorageV2'
}
```

### Deploy your Bicep specification to Azure

1. Log in to Azure  
  ```az login```
1. Select your Subscription  
  ```az account set --subscription [your_subscription]```
1. Create a Resource Group  
  ```az group create --name bicepDemo --location westeurope```
1. Deploy your Bicep specification  
  ```az deployment group create --resource-group bicepDemo --template-file main.bicep```
1. Log in to the Azure Portal and verify that the resource was created.

### Clean up

1. Delete the Resource Group  
  ```az group delete --name bicepDemo --yes```