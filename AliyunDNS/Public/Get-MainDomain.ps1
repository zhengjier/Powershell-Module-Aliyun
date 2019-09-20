# Get main domain info
function Get-MainDomain(){
    param(
        [Parameter(Mandatory=$true)]
        [string]
        $InputString
    )

    # Generate the public parameter with specific action parameter
    $parameters = New-PublicParameter
    $parameters | Add-Member -NotePropertyName 'Action' -NotePropertyValue 'GetMainDomainName'
    $parameters | Add-Member -NotePropertyName 'InputString' -NotePropertyValue $InputString
    
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