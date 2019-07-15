# All group data CSV with report

Connect-AzureAD
$group= Get-AzureADGroup
$id= @($group.ObjectID)
$name= @($group.DisplayName)
for ($i=0; $i -le $id.Length; $i++){
$path = $name[$i]
Get-AzureADGroupMember -ObjectId $id[$i] | Select-Object DisplayName,Mail |Export-Csv -Path C:\Test\$path.csv -Append
$count = Get-AzureADGroupMember -ObjectId $id[$i] | Select-Object DisplayName
$c=$count.Length
Add-Content C:\Test\Report.txt "$($name[$i]) $($c)"
}

#To differentiate On-prem and Cloud users, Get-AzureADGroupMember -ObjectId $id[0] | Select-Object DisplayName,Mail,OnPremisesSecurityIdentifier 
# Add OnPremisesSecurityIdentifier to the objects, only Directory Synced users will have a value, others will be null
