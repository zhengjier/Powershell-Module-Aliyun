# Join all parameters except AccessKeySecret
function Join-Parameters(){
    Param(
        $parameters
    )
    # Convert single PS object to array object in order the sort
    $objects = @()
    $parameters.PSObject.Properties | ForEach-Object{
        $object = New-Object -TypeName PSObject
        $object | Add-Member -MemberType NoteProperty -Name 'Key' -Value $_.Name
        $object | Add-Member -MemberType NoteProperty -Name 'Value' -Value $_.Value
        $objects += $object
    }
    $objects = $objects | Sort-Object -Property Key

    # Join all parameters with specific pattern
    $joinString = ''
    foreach($entry in $objects) {
            switch ($entry.Key) {
                'Record' { 
                    $joinString += 'RR=' + $entry.Value + '&'
                 }
                Default {
                    $joinString += $entry.Key + '=' + $entry.Value + '&'
                }
            }
    }
    $joinString = $joinString.Trim('&')

    return $joinString
}