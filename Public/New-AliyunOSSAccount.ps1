function New-AliyunOSSAccount {
    Param(
        [Parameter(Mandatory=$True,ValueFromPipeline=$True)]
        $OSSName
    )

    begin{
        $Result = [System.Collections.ArrayList]@{}
    }
    process{

        try {
            $UserInfo = New-AliyunRAMUser -UserName $OSSName -DisplayName $OSSName
            $UserKey = New-AliyunRAMUserAccessKey -UserName $OSSName
            Write-Host "[INFO]`tSuccessfully create user $OSSName and generate key/secret pair!" -ForegroundColor Green
        }
        catch {
            Write-Host "[ERROR]`tFailed to create RAM user and generate key/secret pair!" -ForegroundColor Red
            return
        }

        try {
            if ($OSSName.StartsWith('AX')) {
                $Group = "AX_1-8"
            }
            elseif ($OSSName.StartsWith('CUS')) {
                $Group = "Cus_Group"
            }
            else {
                $Group = "AX_1-8"
                Write-Host "[WARN]`tThe user $OSSName does not belongs to any group, will add it to the default group $Group, please check it later!" -ForegroundColor Yellow
            }
            Add-AliyunRAMGroupMember -UserName $OSSName -GroupName $Group | Out-Null

            Write-Host "[INFO]`tSuccessfully add user $OSSName to $Group" -ForegroundColor Green
        }
        catch {
            Write-Host "[ERROR]`tFailed to add user to corresponding group!" -ForegroundColor Red
            return
        }

        try {
            New-AliyunRAMPolicy -OSSName $OSSName -PolicyName $OSSName -Description $OSSName | Out-Null
            Write-Host "[INFO]`tSuccessfully create policy $OSSName for OSS $OSSName" -ForegroundColor Green
        }
        catch{
            Write-Host "[ERROR]`tFailed to create policy $OSSName for OSS $OSSName!" -ForegroundColor Red
        }

        try {
            Add-AliyunRAMPolicyUser -PolicyName $OSSName -UserName $OSSName | Out-Null
            Write-Host "[INFO]`tSuccessfully attach user $OSSName to policy $OSSName" -ForegroundColor Green
        }
        catch {
            Write-Host "[ERROR]`tFailed to attach user $OSSName to policy $OSSName!" -ForegroundColor Red
        }

        $User = [PSCustomObject]@{
            Account = $UserInfo.User.UserName + "@1918760484527978.onaliyun.com"
            AccessKeyId = $UserKey.AccessKeyId
            AccessKeySecret = $UserKey.AccessKeySecret
        }

        $Result += $User
    }
    end{
        Write-Host "[INFO]`tSuccessfully create OSS account and assign permissions to the corresponding OSS bucket folder!" -ForegroundColor Green
        return $Result
    }
}