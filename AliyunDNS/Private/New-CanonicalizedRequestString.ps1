# Canonicalize Request String
function New-CanonicalizedRequestString() {
    param(
        $Parameters
    )

    # Create the string to sign by the Access Key Secret
    $stringToSign = 'GET&%2F&' + ([System.Uri]::EscapeDataString((Join-Parameters $Parameters)))
    $stringToSign = Update-String $stringToSign

    # Sign the request string using HMAC SHA1 method
    $signature = New-HMACEncoding $stringToSign
    $percentSignature = [System.Uri]::EscapeDataString($signature)

    # Add signed signature to the configuration parameters
    $Parameters | Add-Member -NotePropertyName 'Signature' -NotePropertyValue $percentSignature

    # Get the request string with signature included
    $requestParamString = Join-Parameters $Parameters

    # Get the finalized request url
    $apiAccessPoint = (Get-Configuration).OtherParameter.APIAccessPoint
    $canonicalizedString = $apiAccessPoint + '?' + $requestParamString
    
    return $canonicalizedString
}