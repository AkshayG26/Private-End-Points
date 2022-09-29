targetScope = 'subscription'
param location string = 'centralindia'
// param resourceGroupName string

resource resourceGroup 'Microsoft.Resources/resourceGroups@2021-04-01' = {
  name: 'rg-privatetrial-006'
  location: location
}
