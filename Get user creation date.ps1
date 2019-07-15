
Connect-AzureAD
$users=Get-AzureADUser$user_id = $users.ObjectID
$user_name= $users.DisplayName
for ($i=0; $i -lt $user_id.Length; $i++ ){
    $user_name[$i] |Out-File -FilePath "C:\Userlist.txt" -Append
    Get-AzureADUser -ObjectId $user_id[$i] | Select-Object -ExpandProperty ExtensionProperty | Out-File -FilePath "C:\Userlist.txt" -Append
    }
