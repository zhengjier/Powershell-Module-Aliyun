# Error message handler
function Show-ErrorMessage() {
    param(
        [Parameter(Mandatory=$true)]$ErrorMessage
    )

    $errorJSON = $ErrorMessage.ErrorDetails.Message | ConvertFrom-Json
    Write-Host $errorJSON.Code -ForegroundColor Yellow -BackgroundColor Black
    Write-Host $errorJSON.Message -ForegroundColor Yellow -BackgroundColor Black
}