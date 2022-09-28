// 1. Resource Group 
param location string
param storageAccountName string

// 2. Storage Account

module storageaccount 'storageAccount.bicep' = {
  name: storageAccountName
   params: {
    location: location
    storageAccountName: storageAccountName
   }
}
