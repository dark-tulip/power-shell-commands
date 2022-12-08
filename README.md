# power-shell-commands
Команды и некоторые настройки Windows Power Shell

### Основные команды при работе с Power Shell
- Создать подразделения
```ps1
New-ADOrganizationalUnit -Name IT_Department;
```
<hr>

### Пользователи
- Создание нового пользовкателя (Добавление пользователей в домен контроллера)
```ps1
<# This is a comment #>

New-ADUser `
 -SamAccountName TanshTelb3 -Name TanshTelb333 -GivenName Tansh3 `
 -Surname Telb -DisplayName 'Tansh Telb3' -Path 'CN=Users,DC=tansh,DC=kz' `
 -CannotChangePassword $true  -ChangePasswordAtLogon $false -City 'Almaty'  `
 -State 'Almaty’ -Country RK -Department ‘Accounting’ -Title ’Saler' `
 -EmailAddress 'telbayeva@tansh.kz' -Enabled $true -AccountPassword (Read-Host -AsSecureString "12345Zxc")
```
- Выбрать пользователя
```ps1
Get-ADUser "CN=tansh1,CN=Users,DC=tansh,DC=kz"
```
- Удаление пользователя
```ps1
Remove-ADUser -Identity TanshTelb3
```
- Сброс пароля
```ps1
Set-ADAccountPassword -Identity 'CN=Elisa Daugherty,OU=Accounts,DC=Fabrikam,DC=com' `
-Reset -NewPassword (ConvertTo-SecureString -AsPlainText "p@ssw0rd" -Force)
```
<hr>

### Other commands
- Список допустимых устройств Logon Workstations (Список компьютеров, на которые разрешено входить пользователю хранится в атрибуте пользователя в AD) 

- Список таймзон
```ps1
Get-TimeZone -ListAvailable | Where-Object {$_.Id -like "*UTC*"}
```
<hr>

### Политика паролей
https://winitpro.ru/index.php/2018/10/26/politika-parolej-uchetnyx-zapisej-v-active-directory/

- Получить политику по умолчанию
```ps1
Get-ADDefaultDomainPasswordPolicy
```
- Создать свою политику паролей
Precedence. Данный атрибут определяет приоритет данной политики паролей. Если на пользователя AD действуют несколько политик PSO, то к нему будет применена политика с меньшим значением в поле Precedence.
```ps1
New-ADFineGrainedPasswordPolicy -MinPasswordLength 3 -Name simplePolicy -Precedence 20;
```
- Получить установленную для пользователя политику паролей
```ps1
Get-ADUserResultantPasswordPolicy -Identity tanshName;
Add-ADFineGrainedPasswordPolicySubject "simplePolicy" -Subjects "tanshName"
```
<hr>

### Группы
- Список команд для работы с группами
```ps1
Get-Command -Module ActiveDirectory -Name "*Group*"
```
- Получить список всех групп
Параметром GroupScope можно задать один из следующих типов групп:
```ps1
0 = DomainLocal
1 = Global
2 = Universal
```
- Создание группы внутри подразделения
```ps1
New-ADGroup internsGroup -Path 'OU=IT,DC=tansh,DC=kz' -GroupScope DomainLocal;

Get-ADGroup -Filter {Name -like "*interns*"};
```
- Список участников группы
```ps1
Get-ADGroupMember -Identity Administrators
```
- Добавить пользователя в группу
```ps1
Add-ADGroupMember -Identity IT-admins -Members meave, rachel
```
- Список групп в которых состоит пользователь
```ps1
Get-ADPrincipalGroupMembership tanshName | select name
```
<hr>

### Cоздание OU/Группы и пользователя внутри группы

```ps1
New-ADOrganizationalUnit -Name IT_Department;

New-ADFineGrainedPasswordPolicy -MinPasswordLength 8 -Name standardPolicy -Precedence 20;
New-ADFineGrainedPasswordPolicy -MinPasswordLength 12 -Name hardPolicy -Precedence 30;

New-ADGroup IT-users -Path 'OU=IT_Department,DC=tansh,DC=kz' -GroupScope DomainLocal;
New-ADGroup IT-admins -Path 'OU=IT_Department,DC=tansh,DC=kz' -GroupScope DomainLocal;

Add-ADFineGrainedPasswordPolicySubject "standardPolicy" -Subjects " IT-users";
Add-ADFineGrainedPasswordPolicySubject "hardPolicy" -Subjects " IT-admins";

New-ADUser -Name fadriana -EmailAddress fadriana@tansh.kz -CannotChangePassword $false -DisplayName "Franziska Adriana" -UserPrincipalName fadriana@tansh.kz;

Add-ADGroupMember -Identity IT-users -Members fadriana;

Add-ADFineGrainedPasswordPolicySubject -Identity standardPolicy -Subjects fadriana;

Set-ADUser -LogonWorkstations test1 -Identity fadriana;
Set-ADUser -Identity fadriana -HomeDirectory "C:\Users\fadriana";

Get-ADUser -Identity fadriana -Properties LogonWorkstations;
Get-ADUser -Identity fadriana -Properties *;
```
Подробнее про установку атрибутов пользователю
https://learn.microsoft.com/en-us/powershell/module/activedirectory/set-aduser?view=winserver2012r2-ps&redirectedfrom=MSDN

### Open user profiles exe
```
Win+R -> SystemPropertiesAdvanced.exe
```
<hr>
## Audit
### Можно через
```
gpedit.msc
```
### получить полный список GAP (глобальной политики аудита, Global Audit Policy) с установленными параметрами. Cписок всех доступных подкатегорий аудита
```ps1
auditpol /list /subcategory:*
```
### 
