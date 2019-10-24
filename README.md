### Zabbix script - Windows Disk Performance

This script is an update from the script made by Cedric Marcoux.
https://share.zabbix.com/operating-systems/windows/windows-physical-drive-iops

The original script worked, but wasn't able to distinguish a normal disk from an User Profile Disk when you try to monitor an RDS farm. I've made a few adjustments.

Also, I don't like working with base64 encoded strings :)


To make this work, do the following:

- Import the template
- Put the file "discoverdisks.ps1" in on the host under c:\Zabbix. If you want to change this, also adjust the discovery rule
- Add the following lines to your zabbix agent config:

```
Timeout=10
EnableRemoteCommands=1 
UnsafeUserParameters=1
```

The discovery rule will use a powershell to collect all the disks. I've used the filter method in zabbix to get only the actual drives from C: to G:. If you have more, add them to the filter.


I've tested this on Zabbix 4.4, but it should work as well for older versions.
