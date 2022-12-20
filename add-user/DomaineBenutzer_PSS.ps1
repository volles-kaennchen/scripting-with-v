$users=Import-Csv -LiteralPath "c:\User\user.csv" -Delimiter ";" 
foreach ($user in $users) {
$password=$user.Kennwort | ConvertTo-SecureString -AsPlainText -Force 
$ou="OU=" +$user.Abteilung+ ",OU=Mitarbeiter,DC=ATOMGOTT,DC=intern"
$profil="\\DC_FS_1\profile\"+$user.Anmeldename
$heimat="\\DC_FS_1\home\"+$User.Anmeldename
$abteilung="Mitarbeiter_"+$user.Abteilung

New-ADUser -Surname $user.Vorname -GivenName $user.Nachname -SamAccountName $user.Anmeldename -Name $user.Anmeldename -AccountPassword $password -Path $ou -ChangePasswordAtLogon $false -Enabled $true -ProfilePath $profil -HomeDrive "v" -HomeDirectory $heimat
Add-ADGroupmember -Identity $abteilung -Members $user.Anmeldename 
Add-ADGroupmember -Identity "Mitarbeiter" -Members $user.Anmeldename
}
