New-ADUser `
 -SamAccountName TanshTelb3 -Name TanshTelb3 -GivenName Tansh3 `
 -Surname Telb -DisplayName 'Tansh Telb3' -Path 'CN=Users,DC=tansh,DC=kz' `
 -CannotChangePassword $true  -ChangePasswordAtLogon $false -City 'Almaty'  `
 -State 'Almaty’ -Country RK -Department ‘Accounting’ -Title ’Saler' `
 -EmailAddress 'telbayeva@tansh.kz' -Enabled $true -AccountPassword (Read-Host -AsSecureString "12345Zxc") 
 
<# This is a comment #>
