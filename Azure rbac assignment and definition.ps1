#Get RBAC Assignment
Get-AzureRmRoleAssignment | Select-Object Scope,DisplayName,SignInName,RoleDefinitionName #Use Export-CSV if needed


#Get RBAC description
Get-AzureRmRoleDefinition | Select-Object Name,Description #export-CSV if needed
