function New-AliyunRAMUserAccessKey {
    Param(
        [Parameter(Mandatory = $true)]
        $UserName
    )

    $parameters = New-PublicParameter -Service "RAM"
    $parameters | Add-Member -NotePropertyName 'Action' -NotePropertyValue 'CreateAccessKey'
    $parameters | Add-Member -NotePropertyName 'UserName' -NotePropertyValue $UserName
    
    $requestURL = New-CanonicalizedRequestString -Parameters $parameters -Service "RAM"

    try{
        $response = Invoke-WebRequest $requestURL -UseBasicParsing
        $content = $response.Content | ConvertFrom-Json
        return $content.AccessKey | Select-Object AccessKeyId,AccessKeySecret
    }
    catch{
        Show-ErrorMessage $_
    }
}