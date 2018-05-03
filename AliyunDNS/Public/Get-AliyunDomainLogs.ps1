# Get domain operation logs
function Get-AliyunDomainLogs(){
    param(
        [int]$PageNumber,
        [int]$PageSize,
        [string]$KeyWord
    )

    # Generate the public parameter with specific action parameter
    $parameters = New-PublicParameter
    $parameters | Add-Member -NotePropertyName 'Action' -NotePropertyValue 'DescribeDomainLogs'
    
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
        $response = Invoke-WebRequest $requestURL -UseBasicParsing
        $content = $response.Content | ConvertFrom-Json
        return $content
    }
    catch{
        Show-ErrorMessage $_
    }
}