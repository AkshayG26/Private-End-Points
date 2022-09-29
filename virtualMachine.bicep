@description('specifies the name of the Virtual Machine')
param virtualMachineName string

@description('specifies the Location')
param location string

@description('specifies the Computer Name')
param computerName string

@description('specifies the Username')
param adminUsername string

@secure()
@description('specifies the Password')
param adminPassword string

@description('specifies nicID')
param nicId string 

@description('specify the name of nic name')
param nicName string

resource vmnic 'Microsoft.Network/networkInterfaces@2022-01-01' = {
  name: '${nicName}'
   properties: {
    
   }
}


resource virtualMachine 'Microsoft.Compute/virtualMachines@2020-12-01' = {
  name: virtualMachineName
  location: location
  properties: {
    hardwareProfile: {
      vmSize: 'Standard_A2_v2'
    }
    osProfile: {
      computerName: computerName
      adminUsername: adminUsername
      adminPassword: adminPassword
    }
    storageProfile: {
      imageReference: {
        publisher: 'MicrosoftWindowsServer'
        offer: 'WindowsServer'
        sku: '2012-R2-Datacenter'
        version: 'latest'
      }
      osDisk: {
        name: 'name'
        caching: 'ReadWrite'
        createOption: 'FromImage'
      }
    }
    networkProfile: {
      networkInterfaces: [
        {
          id: nicId
        }
      ]
    }
    diagnosticsProfile: {
      bootDiagnostics: {
        enabled: true
        storageUri:  'storageUri'
      }
    }
  }
}

