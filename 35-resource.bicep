param apimName string = ''
param addUniquePostfix bool = true

var apim = addUniquePostfix? 'apim-${apimName}-${uniqueString(resourceGroup().id, deployment().name)}' : 'apim-${apimName}'

resource apimResource 'Microsoft.ApiManagement/service@2021-08-01' = {
  name: apim
  location: 'WestEurope'
  sku: {
    name: 'Consumption'
    capacity: 0
  }
  properties: {
    publisherEmail: 'sven@malvik.de'
    publisherName: 'Sven Malvik'
    
  }
}

output apimOut string = apimResource.id
