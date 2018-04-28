$config = Get-Configuration

$config | Add-Member -NotePropertyName 'RR' -NotePropertyValue '123'
$config | Add-Member -NotePropertyName 'RecordId' -NotePropertyValue '234'

$objects = @()
    $config.PSObject.Properties | ForEach-Object{
        $object = New-Object -TypeName PSObject
        $object | Add-Member -MemberType NoteProperty -Name 'Key' -Value $_.Name
        $object | Add-Member -MemberType NoteProperty -Name 'Value' -Value $_.Value
        $objects += $object
    }
    $objects = $objects | Sort-Object -Property Key

    $objects | Sort-Object -Property Key