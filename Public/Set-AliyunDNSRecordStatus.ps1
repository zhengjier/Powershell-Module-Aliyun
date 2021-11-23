# Update the dns record status
function Set-AliyunDNSRecordStatus() {
    param(
        [Parameter(Mandatory=$true, ValueFromPipelineByPropertyName=$true)]$RecordId,
        [Parameter(Mandatory=$true)][ValidateSet("Enable","Disable")]$Status
    )

    # Generate the public parameter with specific action parameter
    $parameters = New-PublicParameter
    $parameters | Add-Member -NotePropertyName 'Action' -NotePropertyValue 'SetDomainRecordStatus'
    $parameters | Add-Member -NotePropertyName 'RecordId' -NotePropertyValue $RecordId
    $parameters | Add-Member -NotePropertyName 'Status' -NotePropertyValue $Status

    $requestURL = New-CanonicalizedRequestString -Parameters $parameters -Service "DNS"

    try{
        $response = Invoke-WebRequest $requestURL -UseBasicParsing
        $content = $response.Content | ConvertFrom-Json
        return $content
    }
    catch{
        Show-ErrorMessage $_
    }
}