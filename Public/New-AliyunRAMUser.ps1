function New-AliyunRAMUser {
    Param(
        [Parameter(Mandatory = $true)]
        $UserName,
        $DisplayName,
        $MobilePhone,
        $Email,
        $Comments
    )

    $parameters = New-PublicParameter -Service "RAM"
    $parameters | Add-Member -NotePropertyName 'Action' -NotePropertyValue 'CreateUser'
    $parameters | Add-Member -NotePropertyName 'UserName' -NotePropertyValue $UserName
    if($PSBoundParameters.ContainsKey('DisplayName')) {
        $parameters | Add-Member -NotePropertyName 'DisplayName' -NotePropertyValue $DisplayName
    }
    if($PSBoundParameters.ContainsKey('MobilePhone')) {
        $parameters | Add-Member -NotePropertyName 'MobilePhone' -NotePropertyValue $MobilePhone
    }
    if($PSBoundParameters.ContainsKey('Email')) {
        $parameters | Add-Member -NotePropertyName 'Email' -NotePropertyValue $Email
    }
    if($PSBoundParameters.ContainsKey('Comments')) {
        $parameters | Add-Member -NotePropertyName 'Comments' -NotePropertyValue $Comments
    }

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