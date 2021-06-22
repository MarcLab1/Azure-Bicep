@minLength(3)
@maxLength(11)
@description('A simple storage account')
param storagePrefix string = 'storrrr'

@allowed([
  'Standard_LRS'
  'Standard_ZRS'
  'Standard_GRS'
  'Standard_RAGRS'
  'Premium_LRS'
])
param storageSKU string = 'Standard_LRS'

@description('description')
param parameterFake string = 'okjose123'

var uniqueStorageName_var = concat(storagePrefix, uniqueString(resourceGroup().id))
var unusedvariable = uniqueString('12345')
var storageSKU_var = storageSKU

resource uniqueStorageName 'Microsoft.Storage/storageAccounts@2019-06-01' = {
  name: uniqueStorageName_var
  tags: {
    displayName: 'storageaccount1'
  }
  location: resourceGroup().location
  kind: 'StorageV2'
  sku: {
    name: storageSKU_var
    tier: 'Premium'
  }
}

output output1 string = unusedvariable
output output2 string = 'hello${uniqueString('1')}world'
output output3 string = storageSKU