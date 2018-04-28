# Get dns operation logs
function Get-AliyunDNSLogs(){
    param(
        [Parameter(Mandatory=$true)]$DomainName,
        $PageNumber,
        $PageSize,
        $KeyWord
    )

    # Generate the public parameter with specific action parameter
    $parameters = New-PublicParameter
    $parameters | Add-Member -NotePropertyName 'Action' -NotePropertyValue 'DescribeRecordLogs'
    $parameters | Add-Member -NotePropertyName 'DomainName' -NotePropertyValue $DomainName
    # Check optional parameter
    if($PSBoundParameters.ContainsKey('PageNumber')) {
        $parameters | Add-Member -NotePropertyName 'PageNumber' -NotePropertyValue $PageNumber
    }
    if($PSBoundParameters.ContainsKey('PageSize')) {
        $parameters | Add-Member -NotePropertyName 'PageSize' -NotePropertyValue $PageSize
    }
    if($PSBoundParameters.ContainsKey('KeyWord')) {
        $parameters | Add-Member -NotePropertyName 'KeyWord' -NotePropertyValue $KeyWord
    }

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