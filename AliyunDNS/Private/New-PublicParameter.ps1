# Set Pulic Parameter
function New-PublicParameter {
    Param (
        $Service
    )
    # Get configuration from file
    switch ($Service) {
        "DNS" {
            $apiConfig = (Get-Configuration).DNS.PublicParameter
        }
        "VPC" {
            $apiConfig = (Get-Configuration).VPC.PublicParameter
        }
        "ECS" {
            $apiConfig = (Get-Configuration).ECS.PublicParameter
        }
        Default {$apiConfig = (Get-Configuration).DNS.PublicParameter}
    }

    $timestamp = (Get-Date).ToUniversalTime().ToString('yyyy-MM-ddTHH:mm:ssZ')
    $apiConfig | Add-Member -NotePropertyName 'Timestamp' -NotePropertyValue $timestamp # Add current timestamp to configuration
    $apiConfig | Add-Member -NotePropertyName 'SignatureNonce' -NotePropertyValue ([Guid]::NewGuid()) # Add uuid to configuration

    return $apiConfig
}