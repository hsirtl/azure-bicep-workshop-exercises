# Challenge 3

## Add parameters, variables and outputs to your Bicep config

### Open your Bicep config

1. Open the file ```main.bicep``` in VS Code.

### Add parameters

1. Add a parameter for the location of the storage account.  
   ```param location string = 'westeurope'```
1. Add a parameter for the name of your solution.  
   ```param solutionName string```

### Add descriptions to your parameters

1. Add a description to the location parameter.  
   ```@description('The location of the storage account')```
1. Add valid values for the location parameter.  
   ```@allowed(['westeurope', 'northeurope', 'eastus', 'westus'])```
1. Change the resource specification to use the location parameter.  
   ```location: location```
1. Add a description to the solutionName parameter.  
   ```@description('The name of your solution')```
1. Add parameter ```minLength``` and ```maxLength``` to the solutionName parameter.  
   ```@minLength(3)```  
   ```@maxLength(24)```

### Add a variable

1. Add a variable for the storage account name.  
   ```var storageAccountName = '${solutionName}${uniqueString(resourceGroup().id)}'```
1. Change the resource specification to use the variable for the storage account name.  
   ```name: storageAccountName```

### Add an output

1. Add an output for the storage account name.  
   ```output storageAccountName string = storageAccountName```

### Deploy your Bicep config to Azure

A sample solution is available in the [solution](solution) folder.

1. Log in to Azure  
  ```az login```
1. Select your Subscription  
  ```az account set --subscription [your_subscription]```
1. Create a Resource Group  
  ```az group create --name bicepDemo --location westeurope```
1. Deploy your Bicep specification  
  ```az deployment group create --resource-group bicepDemo --template-file main.bicep --parameters solutionName=[your_solution_name]```
1. Log in to the [Azure Portal](https://portal.azure.com) and verify that the storage account was created.

### Clean up your resources

1. Delete the Resource Group  
  ```az group delete --name bicepDemo --yes```