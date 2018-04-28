######################################################
######     This part is basic configuration     ######
######################################################

$Public = @( Get-ChildItem -Path "$PSScriptRoot\Public\*.ps1" )
$Private = @( Get-ChildItem -Path "$PSScriptRoot\Private\*.ps1" )

@($Public + $Private) | ForEach-Object {
    Try {
        . $_.FullName
    } Catch {
        Write-Error -Message "Failed to import function $($_.FullName): $_"
    }
}

################################################################
######  Here is to select which function to be exported   ######
################################################################

Export-ModuleMember -Function $Public.BaseName