// az deployment group create -f ./40-decorator.bicep -g sma-rg

param apimName string = ''
param addUniquePostfix bool = true

@allowed([
  'Consumption' 
  'Developer'
])
param sku string

var apim = addUniquePostfix? 'apim-${apimName}-${uniqueString(resourceGroup().id, deployment().name)}' : 'apim-${apimName}'

resource apimResource 'Microsoft.ApiManagement/service@2021-08-01' = {
  name: apim
  location: 'WestEurope'
  sku: {
    name: sku
    capacity: 0
  }
  properties: {
    publisherEmail: 'sven@malvik.de'
    publisherName: 'Sven Malvik'
    
  }
}

output apimOut string = apimResource.id
