# Get main domain info
function Get-AliyunEIPAddress(){
    param(
        [Parameter(Mandatory=$true)]
        [ValidateSet('cn-hongkong')]
        [string]
        $Region
    )

    # Generate the public parameter with specific action parameter
    $parameters = New-PublicParameter -Service "VPC"
    $parameters | Add-Member -NotePropertyName 'Action' -NotePropertyValue 'DescribeEipAddresses'
    $parameters | Add-Member -NotePropertyName 'RegionId' -NotePropertyValue $Region
    
    $requestURL = New-CanonicalizedRequestString -Parameters $parameters -Service "VPC"

    try{
        $response = Invoke-WebRequest $requestURL -UseBasicParsing
        $content = $response.Content | ConvertFrom-Json
        return $content
    }
    catch{
        Show-ErrorMessage $_
    }
}