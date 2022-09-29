param location string
param vnetName string
param addressPrefix string
param subnetAddressPrefix string
param subnetName1 string

resource virtualNetwork 'Microsoft.Network/virtualNetworks@2019-11-01' = {
  name: vnetName
  location: location
  properties: {
    addressSpace: {
      addressPrefixes: [
        addressPrefix
      ]
    }
    subnets: [
      {
        name: subnetName1
        properties: {
          addressPrefix: subnetAddressPrefix
        }
      }
      // {
      //   name: 'Subnet-2'
      //   properties: {
      //     addressPrefix: '10.1.0.0/24'
      //   }
      // }
    ]
  }
}

// output vnetId string = virtualNetwork.id
output subnetId string = virtualNetwork.properties.subnets[0].id
