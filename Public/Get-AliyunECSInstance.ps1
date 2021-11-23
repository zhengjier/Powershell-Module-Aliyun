# Get main domain info
function Get-AliyunECSInstance(){
    param(
        [Parameter(Mandatory=$true)]
        [ValidateSet('cn-hongkong')]
        [string]
        $Region
    )

    # Generate the public parameter with specific action parameter
    $parameters = New-PublicParameter -Service "ECS"
    $parameters | Add-Member -NotePropertyName 'Action' -NotePropertyValue 'DescribeInstances'
    $parameters | Add-Member -NotePropertyName 'RegionId' -NotePropertyValue $Region
    
    $requestURL = New-CanonicalizedRequestString -Parameters $parameters -Service "ECS"

    try{
        $response = Invoke-WebRequest $requestURL -UseBasicParsing
        $content = $response.Content | ConvertFrom-Json
        return $content
    }
    catch{
        Show-ErrorMessage $_
    }
}