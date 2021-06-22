resource keyVault 'Microsoft.KeyVault/vaults@2019-09-01' = {
  name: 'keyVaultName4141'
  location: 'CanadaCentral'
  properties: {
    enabledForTemplateDeployment: true
    enableRbacAuthorization: true
    enableSoftDelete: true
    enablePurgeProtection: true
    tenantId: subscription().tenantId
    sku: {
      family: 'A'
      name: 'standard'
    }  
  }
}

output sKevVaultId string = keyVault.id


