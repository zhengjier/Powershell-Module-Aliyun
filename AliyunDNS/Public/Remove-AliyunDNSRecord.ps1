# Remove a existing dns record
function Remove-AliyunDNSRecord() {
    param(
        [Parameter(Mandatory=$true, ValueFromPipelineByPropertyName)]$RecordId
    )

    # Generate the public parameter with specific action parameter
    $parameters = New-PublicParameter
    $parameters | Add-Member -NotePropertyName 'Action' -NotePropertyValue 'DeleteDomainRecord'
    $parameters | Add-Member -NotePropertyName 'RecordId' -NotePropertyValue $RecordId

    $requestURL = New-CanonicalizedRequestString $parameters

    try{
        $response = Invoke-WebRequest $requestURL
        $content = $response.Content | ConvertFrom-Json
        return $content
    }
    catch{
        Show-ErrorMessage $_
    }
}