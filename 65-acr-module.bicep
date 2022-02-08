// az bicep publish -f ./40-decorator.bicep --target br:smaacr.azurecr.io/bicep/modules/apim:v2
// az deployment group create -f ./65-acr-module.bicep -g sma-rg

param apimName string

@allowed([
  'Consumption' 
  'Developer'
])
param sku string

module apim 'br:smaacr.azurecr.io/bicep/modules/apim:v2' = {
  name: apimName
  params: {
    apimName: apimName
    sku: sku
  }
}
