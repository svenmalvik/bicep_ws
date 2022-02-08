param apimName string

@allowed([
  'Consumption' 
  'Developer'
])
param sku string

module apim '40-decorator.bicep' = {
  name: apimName
  params: {
    apimName: apimName
    sku: sku
  }
}

