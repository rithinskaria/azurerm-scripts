#Get RBAC Assignment
Get-AzureRmRoleAssignment | Select-Object Scope,DisplayName,SignInName,RoleDefinitionName #Use Export-CSV if needed


#Get RBAC description
Get-AzureRmRoleDefinition | Select-Object Name,Description #export-CSV if needed

#If you have multiple subscriptions and would need report from each sub, use code below. Need at least Reader role in each sub or at management group level to get proper output

Login-AzAccount
$sub_list=Get-AzureRmSubscription
$sub_id=$sub_list.Id
foreach ($id in $sub_id){ 
Set-AzureRmContext -Subscription $id
Get-AzureRmRoleAssignment | select Scope,DisplayName,SignInName,ObjectType,RoleDefinitionName | Export-Csv -Path C:\rbac-reader.csv -Append 
}

