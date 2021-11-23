# New dns record
function New-AliyunEIPAssociate() {
    param(
        [ValidateSet('cn-hongkong')]
        [string]
        $Region,
        [string]$InstanceId,
        [string]$AllocationId
    )
    
    # Generate the public parameter with specific action parameter
    $parameters = New-PublicParameter -Service "VPC"
    $parameters | Add-Member -NotePropertyName 'Action' -NotePropertyValue 'AssociateEipAddress'
    $parameters | Add-Member -NotePropertyName 'RegionId' -NotePropertyValue $Region
    $parameters | Add-Member -NotePropertyName 'InstanceId' -NotePropertyValue $InstanceId
    $parameters | Add-Member -NotePropertyName 'AllocationId' -NotePropertyValue $AllocationId

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