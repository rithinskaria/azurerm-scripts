$managedDisks = Get-AzDisk
$deleted =0
$attached=0

foreach ($disk in $managedDisks) {

    if($disk.ManagedBy -eq $null){
        
            Write-Host "Deleting unattached Managed Disk with Id: $($disk.Name)..."
            $disk | Remove-AzDisk -Force
            Write-Host " "
            Write-Host "Done!!! Deleted unattached Managed Disk with Id: $($disk.Name) "
            $deleted+=1
            
    }

    else{

        Write-Host "The Disk $($disk.Name) is attached to a VM: $($disk.ManagedBy.Split("/")[-1]), hence skipping..."
        $attached+=1
    }


 }
 Write-Host "`n"
 Write-Host "Summary"
 Write-Host "---------"
 Write-Host "No.of deleted disks: $($deleted)"
 Write-Host "No. of attached disks: $($attached)"
 Write-Host "`n"

