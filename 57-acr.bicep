// az deployment group create -f ./70-acr.bicep -g sma-rg

resource acr 'Microsoft.ContainerRegistry/registries@2021-09-01' = {
  name: 'smaacr'
  location: 'WestEurope'
  sku: {
    name: 'Basic'
  }
}

output out string = acr.properties.loginServer
