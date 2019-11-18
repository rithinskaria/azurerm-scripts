$subs= Get-AzSubscription

foreach ($sub in $subs )
{
 Set-AzContext -Subscription $sub.Id
 Write-Host "Subscription :"   $sub.Name
 Write-Host "--------------------------------------"
 $rgs=Get-AzResourceGroup
foreach ($rg in $rgs)
  {
  Write-Host "Resource Group:"   $rg.ResourceGroupName
  Write-Host "--------------------------------------"
  Get-AzConsumptionUsageDetail -BillingPeriodName 201910 -ResourceGroup $rg.ResourceGroupName | ft
  }

}
