# Challenge 5

## Introduce conditional deployments

### Open your Bicep config

1. Open the file ```main.bicep``` in VS Code.

### Add a parameter for the environment type to your Bicep config

1. Add a parameter called ```environmentType``` to your Bicep config. Allowed values should be ```dev```, ```test``` and ```prod```.
1. Define a variable for the ```storageAccountSkuName```.
1. Set the value of the variable to ```Standard_GRS``` if the ```environmentType``` is ```prod``` and to ```Standard_LRS``` otherwise.  
   Hint: Use the ```if``` statement.
1. Set the value of the ```sku``` property of the storage account to the value of the variable ```storageAccountSkuName```. Add a new parameter to the storage account module for the ```sku``` property and pass the value of the variable ```storageAccountSkuName``` to the parameter.

### Deploy your Bicep configuration to Azure

A sample solution is available via following links:
- [main.bicep](https://raw.githubusercontent.com/hsirtl/azure-bicep-workshop-exercises/main/deploy/challenge-05/ch05-main-final.bicep).
- [storageAccount.bicep](https://raw.githubusercontent.com/hsirtl/azure-bicep-workshop-exercises/main/deploy/challenge-05/modules/storageAccount.bicep).

1. Log in to Azure  
  ```az login```
1. Select your Subscription  
  ```az account set --subscription [your_subscription]```
1. Create a Resource Group  
  ```az group create --name bicepDemo --location westeurope```
1. Deploy your Bicep configuration  
  ```az deployment group create --resource-group bicepDemo --template-file main.bicep --parameters solutionName=[your_solution_name] environmentType=prod```
1. Log in to the [Azure Portal](https://portal.azure.com) and verify that the storage account was created.

### Clean up your resources

1. Delete the Resource Group  
  ```az group delete --name bicepDemo --yes```