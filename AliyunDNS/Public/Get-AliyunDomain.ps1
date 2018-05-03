# Get Aliyun Domain Info
function Get-AliyunDomain(){
    [CmdletBinding(DefaultParameterSetName="DomainList")]
    param(
        [Parameter(ParameterSetName="DomainInfo")]
        [string]
        $DomainName,
        [Parameter(ParameterSetName="DomainInfo")]
        [ValidateSet($true,$false)]
        [bool]
        $WhoIs = $false,
        [Parameter(ParameterSetName="DomainList")]
        [int]
        $PageNumber,
        [Parameter(ParameterSetName="DomainList")]
        [int]
        $PageSize,
        [Parameter(ParameterSetName="DomainList")]
        [string]
        $KeyWord,
        [Parameter(ParameterSetName="DomainList")]
        [string]
        $GroupId
    )

    # Generate the public parameter with specific action parameter
    $parameters = New-PublicParameter
    switch ($PSCmdlet.ParameterSetName) {
        "DomainInfo" {
            switch ($WhoIs) {
                $true { 
                    $parameters | Add-Member -NotePropertyName 'Action' -NotePropertyValue 'DescribeDomainWhoisInfo'
                 }
                Default {
                    $parameters | Add-Member -NotePropertyName 'Action' -NotePropertyValue 'DescribeDomainInfo'
                }
            }
            $parameters | Add-Member -NotePropertyName 'DomainName' -NotePropertyValue $DomainName
        }
        Default {
            $parameters | Add-Member -NotePropertyName 'Action' -NotePropertyValue 'DescribeDomains'
        }
    }

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
    if($PSBoundParameters.ContainsKey('GroupId')) {
        $parameters | Add-Member -NotePropertyName 'GroupId' -NotePropertyValue $GroupId
    }

    $requestURL = New-CanonicalizedRequestString $parameters

    try{
        $response = Invoke-WebRequest $requestURL
        switch ($PSCmdlet.ParameterSetName) {
            "DomainInfo" { 
                $content = $response.Content | ConvertFrom-Json
             }
            Default {
                $content = ($response.Content | ConvertFrom-Json).Domains.Domain
            }
        }
        return $content
    }
    catch{
        Show-ErrorMessage $_
    }
}