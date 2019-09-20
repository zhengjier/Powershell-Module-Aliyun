# New dns record
function New-AliyunEIPAddress() {
    param(
        [Parameter(Mandatory=$true)]
        [ValidateSet('cn-hongkong')]
        [string]
        $Region,
        [int]$Bandwidth,
        [ValidateSet('PostPaid', 'PrePaid')]
        [string]
        $InstanceChargeType,
        [ValidateSet('PayByTraffic', 'PayByBandwidth')]
        [string]
        $InternetChargeType
    )
    
    # Generate the public parameter with specific action parameter
    $parameters = New-PublicParameter -Service "VPC"
    $parameters | Add-Member -NotePropertyName 'Action' -NotePropertyValue 'AllocateEipAddress'
    $parameters | Add-Member -NotePropertyName 'RegionId' -NotePropertyValue $Region
    $parameters | Add-Member -NotePropertyName 'Bandwidth' -NotePropertyValue $Bandwidth
    $parameters | Add-Member -NotePropertyName 'InstanceChargeType' -NotePropertyValue $InstanceChargeType
    $parameters | Add-Member -NotePropertyName 'InternetChargeType' -NotePropertyValue $InternetChargeType

    $requestURL = New-CanonicalizedRequestString -Parameters $parameters -Service "VPC"

    try{
        $response = Invoke-WebRequest $requestURL -UseBasicParsing
        $content = $response.Content | ConvertFrom-Json
        return $content
    }
    catch{
        Show-ErrorMessage $_
    }
}