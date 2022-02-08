param apimName string = '${uniqueString(resourceGroup().id, deployment().name)}'

var apim = 'apim-${apimName}'

output apimOut string = apim

// Compile and decompile
// What happend to uniqueString??
