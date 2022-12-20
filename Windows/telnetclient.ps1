Enable-WindowsOptionalFeature -Online -FeatureName TelnetClient 

Get-WindowsOptionalFeature -Online -FeatureName TelnetClient

$PSDefaultParameterValues = @{"*WindowsOptionalFeature:Online"=$true}
