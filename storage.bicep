resource storage1 'Microsoft.Storage/storageAccounts@2021-04-01' = {
  name: 'storage009a'
  location: 'CanadaCentral'
  sku: {
    name: 'Standard_LRS'
  }
  kind: 'StorageV2'
  
}

