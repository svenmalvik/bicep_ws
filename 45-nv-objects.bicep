// az deployment group create -f ./45-objects.bicep -g sma-rg

param apimName string = 'smabiceptest'
param addUniquePostfix bool = true
var apim = addUniquePostfix? 'apim-${apimName}-${uniqueString(resourceGroup().id, deployment().name)}' : 'apim-${apimName}'

param tags object = {
  owner: 'Sven Malvik'
  env: 'Test'
}

resource apimResource 'Microsoft.ApiManagement/service@2021-08-01' = {
  name: apim
  location: 'WestEurope'
  tags: tags
  sku: {
    name: 'Consumption'
    capacity: 0
  }
  properties: {
    publisherEmail: 'sven@malvik.de'
    publisherName: 'Sven Malvik'
    
  }
}

resource apimNV 'Microsoft.ApiManagement/service/namedValues@2021-08-01' = {
  name: 'myNamedValue'
  parent: apimResource
  properties:{
    displayName: 'myNamedValue'
    value: 'Hello World'
  }
}

output apimOut string = apimResource.id
