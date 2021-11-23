# Get Configuration from File
function Get-Configuration() {
    Param(
        $Service
    )
    # Get base location
    $baseLoc = (Get-Module Aliyun.Admin).ModuleBase
    $configPath = $baseLoc + '\config.json'

    # Read configuration and convert to PS object
    $apiConfig = Get-Content $configPath -Raw | ConvertFrom-Json

    return $apiConfig
}