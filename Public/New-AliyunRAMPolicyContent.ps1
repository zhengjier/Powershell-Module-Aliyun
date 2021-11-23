function New-AliyunRAMPolicyContent {
    Param (
        $OSSName
    )

    $PolicyDocument = (Get-Content "$($MyInvocation.MyCommand.Module.ModuleBase)\policy_template.json") -replace '{OSS_NAME}',$OSSName

    return $PolicyDocument
}