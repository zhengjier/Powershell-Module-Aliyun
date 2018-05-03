# Set Pulic Parameter
function New-PublicParameter() {
    # Get configuration from file
    $apiConfig = (Get-Configuration).PublicParameter

    $timestamp = (Get-Date).ToUniversalTime().ToString('yyyy-MM-ddTHH:mm:ssZ')
    $apiConfig | Add-Member -NotePropertyName 'Timestamp' -NotePropertyValue $timestamp # Add current timestamp to configuration
    $apiConfig | Add-Member -NotePropertyName 'SignatureNonce' -NotePropertyValue ([Guid]::NewGuid()) # Add uuid to configuration

    return $apiConfig
}