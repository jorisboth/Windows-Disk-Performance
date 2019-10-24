$drives = Get-WmiObject win32_PerfFormattedData_PerfDisk_PhysicalDisk | 
    ?{$_.name -ne "_Total"} |  
    select Name;

$idx = New-Object Collections.Generic.List[string];
for($i = 0; $i -lt $drives.Length; $i++)
{
   $line= "{ `"{#DISKNUMLET}`" : `"" + $drives[$i].Name + "`" }";
   $idx.Add($line);
}

$OFS = ‘,‘
$result = [String]$idx;
Write-Host "{`"data`":[" $result "]}";