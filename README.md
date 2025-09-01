# Block_MS_Telemetry
A simple batch script that blocks Windows telemetry and tracking domains by modifying the hosts file.

## Quick Start
1. Download `Block_MS_Telemetry.bat`
2. Right-click it and choose “Run as administrator”
3. The script will automatically back up your hosts file and add blocking entries
4. After it finishes, you can delete the batch file

## How It Works
The script modifies the Windows hosts file (located at `C:\Windows\System32\drivers\etc\hosts`), redirecting known telemetry and data-collection domains to the local machine (127.0.0.1), preventing connections to Microsoft servers.

Blocked domains include:
- data.microsoft.com  
- msftconnecttest.com  
- azureedge.net  
- activity.windows.com  
- bingapis.com  
- msedge.net  
- assets.msn.com  
- scorecardresearch.com  
- edge.microsoft.com  
- data.msn.com  

## Features
- Automatic admin rights check  
- Backup of the original file with a timestamp  
- Idempotent (safe to run multiple times)  
- Preserves existing localhost entries  
- Minimalistic and focused domain blocking  

## Restore
To restore the original hosts file:
1. Go to `C:\Windows\System32\drivers\etc\`
2. Find the backup file matching: `hosts.backup_YYYYMMDD_HHMMSS`
3. Rename it to `hosts` (replacing the current file)
