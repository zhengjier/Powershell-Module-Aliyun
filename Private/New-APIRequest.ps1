# Make a request to the API
function New-APIRequest() {
    param(
        [Parameter(Mandatory=$true)]$Parameters
    )

    $requestURL = New-CanonicalizedRequestString $Parameters

    try{
        $response = Invoke-WebRequest $requestURL
        $content = $response.Content | ConvertFrom-Json
        return $content
    }
    catch{
        Show-ErrorMessage $_
    }
}