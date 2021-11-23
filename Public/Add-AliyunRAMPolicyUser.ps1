function Add-AliyunRAMPolicyUser {
    Param (
        $PolicyName,
        [ValidateSet("System", "Custom")]
        $PolicyType = "Custom",
        $UserName
    )

    $parameters = New-PublicParameter -Service "RAM"
    $parameters | Add-Member -NotePropertyName 'Action' -NotePropertyValue 'AttachPolicyToUser'
    $parameters | Add-Member -NotePropertyName 'PolicyName' -NotePropertyValue $PolicyName
    $parameters | Add-Member -NotePropertyName 'PolicyType' -NotePropertyValue $PolicyType
    $parameters | Add-Member -NotePropertyName 'UserName' -NotePropertyValue $UserName

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