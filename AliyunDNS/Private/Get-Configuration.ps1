# Get Configuration from File
function Get-Configuration() {
    # Get base location
    $baseLoc = (Get-Module AliyunDNS).ModuleBase
    $configPath = $baseLoc + '\config.json'

    # Read configuration and convert to PS object
    $apiConfig = Get-Content $configPath | ConvertFrom-Json

    return $apiConfig
}