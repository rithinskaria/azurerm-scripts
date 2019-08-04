# Groups and users in text

Connect-AzureAD
$group= Get-AzureADGroup
$id= @($group.ObjectID)
$name= @($group.DisplayName)
for ($i=0; $i -lt $id.Length; $i++){
$name[$i] |Out-File -FilePath "C:\ADGroups.txt" -Append
Get-AzureADGroupMember -ObjectId $id[$i] | Select-Object DisplayName,Mail | Out-File -FilePath "C:\ADGroups.txt" -Append
}
