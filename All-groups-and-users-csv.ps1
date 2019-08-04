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

#To differentiate On-prem and Cloud users, Get-AzureADGroupMember -ObjectId $id[$i] | Select-Object DisplayName,Mail,OnPremisesSecurityIdentifier 
# Add OnPremisesSecurityIdentifier to the objects, only Directory Synced users will have a value, others will be null

#If not all groups are coming in the list; use:

$output = @()
$gid = (Get-AzureADGroup -All $true)
foreach ($groupid in $gid) {
    $memeber = Get-AzureADGroupMember -ObjectId $groupid.objectid | Select-Object {$_.DisplayName -like '*sams*'}
    $data = New-Object -TypeName psobject
    $data | Add-Member -MemberType NoteProperty -Name 'group name' -Value $groupid.DisplayName
    $data | Add-Member -MemberType NoteProperty -Name 'user UPN' -Value $memeber.UserPrincipalName
    $output += $data
}
$output | Out-GridView | Out-File -FilePath 'C:\\temp\\ADGroups+Members.txt' -Append

