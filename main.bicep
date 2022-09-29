@description('specify the name of storange account')
param storageAccountName string

@description('specify the location')
param location string

//....................................................vnet.........................................................................
@description('specify the name of virtual network')
param vnetName string

@description('specify the name of subnet1')
param subnetName1 string

@description('specify the address prefix of vnet')
param addressPrefix string

@description('specify the name subnet address prefix')
param subnetAddressPrefix string

//....................................................nic.................................................

@description('specify the name of network interface card')
param nicName string


// @description('specify the name of the subbnet address prefix')
// param subnetAddressPrefix string

// ..................................................storage account module..................................................

module storageAccount 'storageAccount.bicep' = {
  name: 'storageaccount'
  params: {
    location: location
    storageAccountName: storageAccountName
  }
}

//.........................................................virtual network module.............................................

module virtualNetwork 'vnet.bicep' = {
  name: 'vnetname'
  params: {
    location: location
    vnetName: vnetName
    addressPrefix: addressPrefix
    subnetAddressPrefix: subnetAddressPrefix
    subnetName1: subnetName1
  }
}

//......................................................network interface card module.............................................

module networkInterface 'nic.bicep' = {
  name: 'nicname'
  params: {
    location: location
    nicName: nicName
    subnetName: subnetName1
    vnetName: vnetName
  }
}
