# Define the default service to use when executing requests
$PSDefaultParameterValues['Invoke-RestRequest:Service'] = 'AzureDevOps'

Set-RestServiceMetadata -Service 'AzureDevOps' -NotConnectedMessage 'Not connected yet! Use Connect-AdsService to establish a connection first.'