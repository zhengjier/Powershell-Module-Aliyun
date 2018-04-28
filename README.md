# PowershellModule-AliyunDNS
[English](#introduction) [中文](#简介)
## Introduction
This Powershell module allows you to do some basic DNS operations on Aliyun DNS.\
Including query, create, edit and remove any dns records on Aliyun DNS.
## Compatibility
| PS Version | Compatibility |
| :---: | :---: |
| 5.1 | :heavy_check_mark: |
| 5.0 |  |
| 4.0 |  |
| 3.0 |  |
| 2.0 |  |
## Install
To use this module
1. Copy the "AliyunDNS" folder to your PS module path.\
    Normally is `%USERPROFILE%\Documents\WindowsPowershell\Modules\`
2. Edit the `config.json` file under the 'AliyunDNS' folder. 
Add the `AccessKeyId` and `AccessKeySecret` value to the file.\
    *Note: You should get these two values from Aliyun Admin Panel or ask your DNS administrator.*
3. Launch a Powershell window run as administrator.
4. Execute the following powershell command to allow unsigned powershell scripts:
```powershell
Set-ExecutionPolicy Unrestricted
```
5. Execute the folloing powershell command to start using the module and then have fun!:smile:\
*Note: You could use this module without runing as administrator.*
```powershell
Import-Module AliyunDNS
```
## Usage
### Get dns records
```powershell
Get-AliyunDNSRecord
    [Mandatory]-Doamin <DomainName>
    [Mandatory]-RecordId <RecordId>
    [Mandatory]-SubDomain <SubDomainName>
    -PageNumber <PageNo>
    -PageSize <PageSize>
    -Type <RecordType>
```
*Note: You can only pass one of the mandatory parameters above.*
### Create new dns record
```powershell
New-AliyunDNSRecord
    [Mandatory]-DomainName <DomainName>
    [Mandatory]-RR <Host>
    [Mandatory]-Type <RecordType>
    [Mandatory]-Value <RecordValue>
    -TTL <TTL>
    -Priority <Priority>
    -Line <Line>
```
### Update dns record information
```powershell
Update-AliyunDNSRecord
    [Mandatory]-RecordId <RecordId>
    [Mandatory]-RR <Host>
    [Mandatory]-Type <RecordType>
    [Mandatory]-Value <RecordValue>
    -TTL <TTL>
    -Priority <Priority>
    -Line <Line>
```
### Set dns status
```powershell
Set-AliyunDNSRecordStatus
    [Mandatory]-RecordId <RecordId>
    [Mandatory]-Status <Status>
```
### Remove dns record
```powershell
Remove-AliyunDNSRecord
    [Mandatory]-RecordId <RecordId>
```

# 阿里云DNS Powershell模块
## 简介
阿里云DNS powershell模块用于进行基本的云解析操作，例如查询，新建，编辑，删除记录等
## 兼容性
| Powershell版本 | 兼容性 |
| :---: | :---: |
| 5.1 | :heavy_check_mark: |
| 5.0 |  |
| 4.0 |  |
| 3.0 |  |
| 2.0 |  |
## 安装
按照下面的步骤进行安装
1. 拷贝AliyunDNS文件夹至powershell模块的默认路径。\
    通常为`%USERPROFILE%\Documents\WindowsPowershell\Modules\`
2. 编辑AliyunDNS文件夹中的`config.json`文件。\
    添加`AccessKeyId`和`AccessKeySecret`的值。\
    *注意: 你可以从阿里云的管理员中心获得这两个值，或者向你的DNS管理员寻求帮助。*
3. 以管理员身份打开Powershell窗口。
4. 执行以下命令以允许运行未签名的脚本：
```powershell
Set-ExecutionPolicy Unrestricted
```
5. 执行以下指令以导入此模块，然后就可以愉快的使用了!:smile:\
*注意: 你可以不需要以管理员身份运行Powershell来使用此模块*
```powershell
Import-Module AliyunDNS
```
## 使用方法
### 获取DNS记录
```powershell
Get-AliyunDNSRecord
    [Mandatory]-Doamin <DomainName>
    [Mandatory]-RecordId <RecordId>
    [Mandatory]-SubDomain <SubDomainName>
    -PageNumber <PageNo>
    -PageSize <PageSize>
    -Type <RecordType>
```
*注意: 在这个命令中你只允许传入一个强制参数。*
### 新建DNS域名记录
```powershell
New-AliyunDNSRecord
    [Mandatory]-DomainName <DomainName>
    [Mandatory]-RR <Host>
    [Mandatory]-Type <RecordType>
    [Mandatory]-Value <RecordValue>
    -TTL <TTL>
    -Priority <Priority>
    -Line <Line>
```
### 更新NDS记录内容信息
```powershell
Update-AliyunDNSRecord
    [Mandatory]-RecordId <RecordId>
    [Mandatory]-RR <Host>
    [Mandatory]-Type <RecordType>
    [Mandatory]-Value <RecordValue>
    -TTL <TTL>
    -Priority <Priority>
    -Line <Line>
```
### 设置DNS记录状态
```powershell
Set-AliyunDNSRecordStatus
    [Mandatory]-RecordId <RecordId>
    [Mandatory]-Status <Status>
```
### 删除DNS记录
```powershell
Remove-AliyunDNSRecord
    [Mandatory]-RecordId <RecordId>
```