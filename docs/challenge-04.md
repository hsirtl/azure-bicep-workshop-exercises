# Challenge 4

## Refactor your template to use modules

### Open your Bicep config

1. Open the file ```main.bicep``` in VS Code.

### Refactor the config so that the resources are in modules

1. Create a new folder called ```modules```.
1. Create a new file called ```storageAccount.bicep``` in the ```modules``` folder.
1. Move the ```resource``` block for the storage account into the new file.

The module should fulfill the following requirements:
- The module should have a parameter called ```location```.
- The module should have a parameter called ```storageAccountName```.
- The module should return the ```storageAccountName``` of the storage account.

The main config should fulfill the following requirements:
- The main config should have a parameter called ```location```.
- The main config should have a parameter called ```solutionName```.
- The main config should return the ```storageAccountName``` referencing the output of the storage account module.

### Deploy your Bicep configuration to Azure

A sample solution is available via following links:
- [main.bicep](https://raw.githubusercontent.com/hsirtl/azure-bicep-workshop-exercises/main/deploy/challenge-04/ch04-main-final.bicep).
- [storageAccount.bicep](https://raw.githubusercontent.com/hsirtl/azure-bicep-workshop-exercises/main/deploy/challenge-04/modules/storageAccount.bicep).

1. Log in to Azure  
  ```az login```
1. Select your Subscription  
  ```az account set --subscription [your_subscription]```
1. Create a Resource Group  
  ```az group create --name bicepDemo --location westeurope```
1. Deploy your Bicep configuration  
  ```az deployment group create --resource-group bicepDemo --template-file main.bicep --parameters solutionName=[your_solution_name]```
1. Log in to the [Azure Portal](https://portal.azure.com) and verify that the storage account was created.

### Clean up your resources

1. Delete the Resource Group  
  ```az group delete --name bicepDemo --yes```