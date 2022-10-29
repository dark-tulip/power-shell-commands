New-ADUser `
 -SamAccountName TanshTelb3 -Name TanshTelb3 -GivenName Tansh3 `
 -Surname Telb -DisplayName 'Tansh Telb3' -Path 'CN=Users,DC=tansh,DC=kz' `
 -CannotChangePassword $true  -ChangePasswordAtLogon $false -City 'Almaty'  `
 -State 'Almaty’ -Country RK -Department ‘Accounting’ -Title ’Saler' `
 -EmailAddress 'telbayeva@tansh.kz' -Enabled $true -AccountPassword (Read-Host -AsSecureString "12345Zxc") 
 
<# This is a comment #>

New-ADUser `
 -SamAccountName TanshTelb3 -Name TanshTelb333 -GivenName Tansh3 `
 -Surname Telb -DisplayName 'Tansh Telb3' -Path 'CN=Users,DC=tansh,DC=kz' `
 -CannotChangePassword $true  -ChangePasswordAtLogon $false -City 'Almaty'  `
 -State 'Almaty’ -Country RK -Department ‘Accounting’ -Title ’Saler' `
 -EmailAddress 'telbayeva@tansh.kz' -Enabled $true -AccountPassword (Read-Host -AsSecureString "12345Zxc")

 

Remove-ADUser -Identity TanshTelb3

 
 
 Set-ADAccountPassword -Identity 'CN=Elisa Daugherty,OU=Accounts,DC=Fabrikam,DC=com' `
-Reset -NewPassword (ConvertTo-SecureString -AsPlainText "p@ssw0rd" -Force)

 
<#
-AccountPassword (Read-Host -AsSecureString "12345Zxc")     
 New-ADUser -Name Tansh -AccountExpirationDate 12.12.2023 -AccountPassword 12345Zxc -AllowReversiblePasswordEncryption trur -City Almaty -Company MyCompany -Initials TTUser -Office LikeHR -OfficePhone 87776665544 -PasswordNeverExpires true -StreetAddress almatyStreet -Surname telbayeva -Title myTitle -Type user -UserPrincipalName tanshusername #>
