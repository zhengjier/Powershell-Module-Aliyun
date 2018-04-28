# Powershell HMAC Encoding
function New-HMACEncoding() {
    param(
        [parameter(Mandatory=$true)]$Message,
        $Type = 'HMACSHA1'
    )
    # Get Access Key Secret
    $apiConfig = Get-Configuration
    $secret = $apiConfig.OtherParameter.AccessKeySecret

    # HMAC Encoding
    $hmacsha = New-Object System.Security.Cryptography.$Type
    $hmacsha.key = [Text.Encoding]::ASCII.GetBytes($secret + '&')
    $signature = $hmacsha.ComputeHash([Text.Encoding]::ASCII.GetBytes($Message))
    $signature = [Convert]::ToBase64String($signature)

    return $signature
}