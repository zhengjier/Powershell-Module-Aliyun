# PowershellModule-AliyunDNS
[English](#table-of-content) [中文](#简介)
## Table of Content
- [Introduction](#introduction)
- [Compatibility](#compatibility)
- [Installation](#installation)
- [Usage](#usage)
  - [DNS Records Management](#dns-records-management)
    - [Get DNS Records](#get-dns-records)
    - [Create New DNS Record](#create-new-dns-record)
    - [Update DNS Record Information](#update-dns-record-information)
    - [Set DNS Status](#set-dns-status)
    - [Remove DNS Record](#remove-dns-record)
  - [Domain Management](#domain-management)
    - [Get Domain Information](#get-domain-information)
    - [Get Domain Logs](#get-domain-logs)
    - [Get Main Domain](#get-main-domain)
- [More Information](#more-information)
## Introduction
This Powershell module allows you to do some basic DNS operations on Aliyun DNS.\
Including query, create, edit and remove any dns records on Aliyun DNS.
## Compatibility
| PS Version | Compatibility |
| :---: | :---: |
| 5.1 | :heavy_check_mark: |
| 5.0 | :heavy_check_mark: |
| 4.0 | :heavy_check_mark: |
| 3.0 | :heavy_check_mark: |
| 2.0 | :x: |
## Installation
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
## Usage
Execute the folloing powershell command to start using the module and then have fun!:smile:
```powershell
Import-Module AliyunDNS
```
### DNS Records Management
#### Get DNS Records
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
#### Create New DNS Record
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
#### Update DNS Record Information
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
#### Set DNS Status
```powershell
Set-AliyunDNSRecordStatus
    [Mandatory]-RecordId <RecordId>
    [Mandatory]-Status <Status>
```
#### Remove DNS Record
```powershell
Remove-AliyunDNSRecord
    [Mandatory]-RecordId <RecordId>
```
### Domain Management
#### Get Domain Information
```powershell
Get-AliyunDomain
    -DomainName <DomainName>
    -WhoIs <$True|$False>
Get-AliyunDomain
    -PageNumber <PageNumber>
    -PageSize <PageSize>
```
#### Get Domain Logs
```powershell
Get-AliyunDomainLogs
    -PageNumber <PageNumber>
    -PageSize <PageSize>
    -KeyWord <Keyword>
```
#### Get Main Domain
```powershell
Get-MainDomain
    -InputString <HostName>
```
## More Information
For more information, please use `help <Command>`

# 阿里云DNS Powershell模块
## 目录
- [简介](#简介)
- [兼容性](#兼容性)
- [安装](#安装)
- [使用方法](#使用方法)
  - [域名解析管理](#域名解析管理)
    - [获取DNS记录](#获取dns记录)
    - [新建DNS域名记录](#新建dns域名记录)
    - [更新NDS记录内容信息](#更新dns记录内容信息)
    - [设置DNS记录状态](#设置dns记录状态)
    - [删除DNS记录](#删除dns记录)
  - [域名管理](#域名管理)
    - [获取域名信息](#获取域名信息)
    - [获取域名日志](#获取域名日志)
    - [获取主域名](#获取主域名)
- [更多帮助](#更多帮助)
## 简介
阿里云DNS powershell模块用于进行基本的云解析操作，例如查询，新建，编辑，删除记录等
## 兼容性
| Powershell版本 | 兼容性 |
| :---: | :---: |
| 5.1 | :heavy_check_mark: |
| 5.0 | :heavy_check_mark: |
| 4.0 | :heavy_check_mark: |
| 3.0 | :heavy_check_mark: |
| 2.0 | :x: |
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
## 使用方法
执行以下指令以导入此模块，然后就可以愉快的使用了!:smile:
```powershell
Import-Module AliyunDNS
```
### 域名解析管理
#### 获取DNS记录
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
#### 新建DNS域名记录
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
#### 更新NDS记录内容信息
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
#### 设置DNS记录状态
```powershell
Set-AliyunDNSRecordStatus
    [Mandatory]-RecordId <RecordId>
    [Mandatory]-Status <Status>
```
#### 删除DNS记录
```powershell
Remove-AliyunDNSRecord
    [Mandatory]-RecordId <RecordId>
```
### 域名管理
#### 获取域名信息
```powershell
Get-AliyunDomain
    -DomainName <DomainName>
    -WhoIs <$True|$False>
Get-AliyunDomain
    -PageNumber <PageNumber>
    -PageSize <PageSize>
```
#### 获取域名日志
```powershell
Get-AliyunDomainLogs
    -PageNumber <PageNumber>
    -PageSize <PageSize>
    -KeyWord <Keyword>
```
#### 获取主域名
```powershell
Get-MainDomain
    -InputString <HostName>
```
## 更多帮助
更多帮助信息请使用`help <Command>`查询