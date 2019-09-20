# Remove a existing dns record
function Remove-AliyunEIPAddress() {
    param(
        [Parameter(Mandatory=$true, ValueFromPipelineByPropertyName=$true)]$AllocationId
    )

    # Generate the public parameter with specific action parameter
    $parameters = New-PublicParameter -Service "VPC"
    $parameters | Add-Member -NotePropertyName 'Action' -NotePropertyValue 'ReleaseEipAddress'
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