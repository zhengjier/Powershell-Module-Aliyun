# Update existing dns record
function Update-AliyunDNSRecord() {
    param(
        [Parameter(Mandatory=$true, ValueFromPipelineByPropertyName)]
        [string]
        $RecordId,
        [Parameter(Mandatory=$true, ValueFromPipelineByPropertyName)]
        [string]
        $RR,
        [Parameter(Mandatory=$true, ValueFromPipelineByPropertyName)]
        [ValidateSet("A","NS","MX","TXT","CNAME","SRV","AAAA","CAA","REDIRECT_URL","FORWARD_URL")]
        [string]
        $Type,
        [Parameter(Mandatory=$true, ValueFromPipelineByPropertyName)]
        [string]
        $Value,
        [long]$TTL,
        [long]$Priority,
        [string]$Line
    )

    # Generate the public parameter with specific action parameter
    $parameters = New-PublicParameter
    $parameters | Add-Member -NotePropertyName 'Action' -NotePropertyValue 'UpdateDomainRecord'
    $parameters | Add-Member -NotePropertyName 'RecordId' -NotePropertyValue $RecordId
    $parameters | Add-Member -NotePropertyName 'Record' -NotePropertyValue $RR
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