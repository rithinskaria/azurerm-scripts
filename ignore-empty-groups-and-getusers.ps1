# Groups only with members to CSV with report
Connect-AzureAD
$group= Get-AzureADGroup
$id= @($group.ObjectID)
$name= @($group.DisplayName)
for ($i=0; $i -lt $id.Length; $i++){
$path = $name[$i]
$count = Get-AzureADGroupMember -ObjectId $id[$i] | Select-Object DisplayName
$c=$count.Length
if ($c -gt 0){
Get-AzureADGroupMember -ObjectId $id[$i] | Select-Object DisplayName,Mail |Export-Csv -Path C:\Test\$path.csv -Append
Add-Content C:\Test\Report.txt "$($name[$i]) $($c)"
}
}
