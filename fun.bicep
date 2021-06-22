param currentTime string = utcNow()
param global bool = false

var rgLocation = resourceGroup().location
var rgId = resourceGroup().id
var rgName = resourceGroup().name
var rgtype = resourceGroup().type

var uniqueName1 = 'storage${currentTime}'
var uniqueName2 = 'storage${uniqueString(rgId)}'
var nonUniqueName = 'storage'

resource stg1 'Microsoft.Storage/storageAccounts@2019-06-01' = {
  name: nonUniqueName
  location: rgLocation
  kind: 'Storage'
  sku: {
    name: global ? 'Standard_GRS' : 'Standard_LRS' //will default to LRS because global is set to false
  }
}

//If reference any property of the prerequisite resource using the name (st1), 
//the dependsOn property is added automatically
resource blob 'Microsoft.Storage/storageAccounts/blobServices/containers@2019-06-01' = {
  name: '${stg1.name}/default/logs'
}

output str1 string = toLower(uniqueName1)
output str2 string = toLower(uniqueName2)
