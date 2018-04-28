# Get dns records with specified domain name
function Get-AliyunDNSRecord() {
    param(
        [Parameter(Mandatory=$true, ParameterSetName='byDomain')]$Domain,
        [Parameter(Mandatory=$true, ParameterSetName='byRecordId')]$RecordId,
        [Parameter(Mandatory=$true, ParameterSetName='bySubDomain')]$SubDomain,
        $PageNumber,
        $PageSize,
        [ValidateSet("A","NS","MX","TXT","CNAME","SRV","AAAA","CAA","REDIRECT_URL","FORWARD_URL")]
        $Type
    )

    # Generate the public parameter with specific action parameter
    # Check parameter set
    $parameters = New-PublicParameter
    if($PSBoundParameters.ContainsKey('Domain')){
        $parameters | Add-Member -NotePropertyName 'Action' -NotePropertyValue 'DescribeDomainRecords'
        $parameters | Add-Member -NotePropertyName 'DomainName' -NotePropertyValue $Domain
    }
    if($PSBoundParameters.ContainsKey('RecordId')){
        $parameters | Add-Member -NotePropertyName 'Action' -NotePropertyValue 'DescribeDomainRecordInfo'
        $parameters | Add-Member -NotePropertyName 'RecordId' -NotePropertyValue $RecordId
    }
    if($PSBoundParameters.ContainsKey('SubDomain')){
        $parameters | Add-Member -NotePropertyName 'Action' -NotePropertyValue 'DescribeSubDomainRecords'
        $parameters | Add-Member -NotePropertyName 'SubDomain' -NotePropertyValue $SubDomain
    }

    # Check optional parameter
    if($PSBoundParameters.ContainsKey('PageNumber')) {
        $parameters | Add-Member -NotePropertyName 'PageNumber' -NotePropertyValue $PageNumber
    }
    if($PSBoundParameters.ContainsKey('PageSize')) {
        $parameters | Add-Member -NotePropertyName 'PageSize' -NotePropertyValue $PageSize
    }
    if($PSBoundParameters.ContainsKey('Type')) {
        $parameters | Add-Member -NotePropertyName 'Type' -NotePropertyValue $Type
    }

    # Generate the request url
    $requestURL = New-CanonicalizedRequestString $parameters

    try{
        $response = Invoke-WebRequest $requestURL
        if($PSBoundParameters.ContainsKey('Domain')){
            $content = ($response.Content | ConvertFrom-Json).DomainRecords.Record
        }
        if($PSBoundParameters.ContainsKey('SubDomain')){
            $content = ($response.Content | ConvertFrom-Json).DomainRecords.Record
        }
        if($PSBoundParameters.ContainsKey('RecordId')){
            $content = $response.Content | ConvertFrom-Json
        }
        return $content
    }
    catch{
        Show-ErrorMessage $_
    }
}