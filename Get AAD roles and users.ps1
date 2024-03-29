# Groups and Description

Get-AzureADDirectoryRole # To ignore Object ID, use Select-Object DisplayName,Description

#AAD Groups and Users
Connect-AzureAD
$group= Get-AzureADDirectoryRole # This will select only the roles which has assignments
$id= @($group.ObjectID)
$name= @($group.DisplayName)
for ($i=0; $i -lt $id.Length; $i++){
$path = $name[$i]
Get-AzureADDirectoryRoleMember -ObjectId $id[$i] | Export-Csv -Path C:\Test\$path.csv # First run and select the fields from raw CSV and then use Select-Object
} 
