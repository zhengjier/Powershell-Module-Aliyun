# New dns record
function New-AliyunDNSRecord() {
    param(
        [Parameter(Mandatory=$true)]
        [string]
        $DomainName,
        [Parameter(Mandatory=$true)]
        [string]
        $RR,
        [Parameter(Mandatory=$true)]
        [ValidateSet("A","NS","MX","TXT","CNAME","SRV","AAAA","CAA","REDIRECT_URL","FORWARD_URL")]
        [string]
        $Type,
        [Parameter(Mandatory=$true)]
        [string]
        $Value,
        [long]$TTL,
        [long]$Priority,
        [string]$Line
    )
    
    # Generate the public parameter with specific action parameter
    $parameters = New-PublicParameter
    $parameters | Add-Member -NotePropertyName 'Action' -NotePropertyValue 'AddDomainRecord'
    $parameters | Add-Member -NotePropertyName 'DomainName' -NotePropertyValue $DomainName
    $parameters | Add-Member -NotePropertyName 'RR' -NotePropertyValue $RR
    $parameters | Add-Member -NotePropertyName 'Type' -NotePropertyValue $Type
    $parameters | Add-Member -NotePropertyName 'Value' -NotePropertyValue $Value
    # Check optional parameter
    if($PSBoundParameters.ContainsKey('TTL')) {
        $parameters | Add-Member -NotePropertyName 'TTL' -NotePropertyValue $TTL
    }
    if($PSBoundParameters.ContainsKey('Priority')) {
        $parameters | Add-Member -NotePropertyName 'Priority' -NotePropertyValue $Priority
    }
    if($PSBoundParameters.ContainsKey('Line')) {
        $parameters | Add-Member -NotePropertyName 'Line' -NotePropertyValue $Line
    }

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