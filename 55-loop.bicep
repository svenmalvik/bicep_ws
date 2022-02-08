// az deployment group create -f ./50-secrets.bicep -g sma-rg --parameters apimName=50-secrets

param apimName string = ''
param addUniquePostfix bool = true
var apim = addUniquePostfix? 'apim-${apimName}-${uniqueString(resourceGroup().id, deployment().name)}' : 'apim-${apimName}'

param tags object = {
  owner: 'Sven Malvik'
  env: 'Test'
}

param nvList object = {
  prop1: 'value1'
  prop2: 'value2'
  prop3: 'value3'
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

resource apimNV 'Microsoft.ApiManagement/service/namedValues@2021-08-01' = [for nv in items(nvList): {
  name: nv.key
  parent: apimResource
  properties:{
    displayName: nv.key
    value: nv.value
  }
}]

output apimOut string = apimResource.id
