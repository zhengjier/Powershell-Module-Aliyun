# Replace String with specific patterns
function Update-String() {
    Param(
        $String,
        [switch]$PolicyDocument
    )
    
    $String = $String.Replace('+', '%20')
    $String = $String.Replace('*', '%2A')
    $String = $String.Replace('%7E', '~')
    if (!$PolicyDocument) {
        $String = $String.Replace('%3A', '%253A')
    }

    return $String
}