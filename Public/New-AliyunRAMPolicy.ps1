function New-AliyunRAMPolicy {
    Param(
        [Parameter(Mandatory = $true)]
        $OSSName,
        [Parameter(Mandatory = $true)]
        $PolicyName,
        $Description
    )

    $PolicyDocument = (Get-Content "$($MyInvocation.MyCommand.Module.ModuleBase)\policy.json") -replace '{OSS_NAME}',$OSSName

    # $PolicyDocument
    $parameters = New-PublicParameter -Service "RAM"
    $parameters | Add-Member -NotePropertyName 'Action' -NotePropertyValue 'CreatePolicy'
    $parameters | Add-Member -NotePropertyName 'PolicyDocument' -NotePropertyValue $PolicyDocument
    $parameters | Add-Member -NotePropertyName 'PolicyName' -NotePropertyValue $PolicyName
    if($PSBoundParameters.ContainsKey('Description')) {
        $parameters | Add-Member -NotePropertyName 'Description' -NotePropertyValue $Description
    }

    # $parameters.PolicyDocument

    $requestURL = New-CanonicalizedRequestString -Parameters $parameters -Service "RAM"

    # $requestURL
    try{
        $response = Invoke-WebRequest $requestURL -UseBasicParsing
        $content = $response.Content | ConvertFrom-Json
        return $content
    }
    catch{
        Show-ErrorMessage $_
    }
}