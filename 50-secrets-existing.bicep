// az deployment group create -f ./50-secrets-existing.bicep -g sma-rg

param apimName string
param addUniquePostfix bool = false
var apim = addUniquePostfix? 'apim-${apimName}-${uniqueString(resourceGroup().id, deployment().name)}' : 'apim-${apimName}'

@secure()
param mysecret string

resource apimResource 'Microsoft.ApiManagement/service@2021-08-01' existing = {
  name: apim
}

resource apimNV 'Microsoft.ApiManagement/service/namedValues@2021-08-01' = {
  name: 'myNamedSecret'
  parent: apimResource
  properties:{
    displayName: 'myNamedSecret'
    value: mysecret
    secret: true
  }
}

output apimOut string = apimResource.id
