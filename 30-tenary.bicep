param apimName string = ''
param addUniquePostfix bool = true

var apim = addUniquePostfix? 'apim-${apimName}-${uniqueString(resourceGroup().id, deployment().name)}' : 'apim-${apimName}'

output apimOut string = apim
