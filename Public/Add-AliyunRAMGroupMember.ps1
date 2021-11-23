function Add-AliyunRAMGroupMember {
    Param(
        [Parameter(Mandatory = $true)]
        $UserName,
        [Parameter(Mandatory = $true)]
        $GroupName
    )

    $parameters = New-PublicParameter -Service "RAM"
    $parameters | Add-Member -NotePropertyName 'Action' -NotePropertyValue 'AddUserToGroup'
    $parameters | Add-Member -NotePropertyName 'UserName' -NotePropertyValue $UserName
    $parameters | Add-Member -NotePropertyName 'GroupName' -NotePropertyValue $GroupName

    $requestURL = New-CanonicalizedRequestString -Parameters $parameters -Service "RAM"

    try{
        $response = Invoke-WebRequest $requestURL -UseBasicParsing
        $content = $response.Content | ConvertFrom-Json
        return $content
    }
    catch{
        Show-ErrorMessage $_
    }
}