Get-Process -Name "AWSReplicationWindowsInstaller" -ErrorAction SilentlyContinue # validate installation status
 
Get-Process -Name "AWSReplicationWindowsInstaller" -ErrorAction SilentlyContinue | Stop-Process -Force # clean all process

Test-Path "C:\Program Files (x86)\AWS Replication Agent" # "True" means installation success

Get-Content -Path ".\agent.log.0" | Select-String -Pattern "error" | Select-Object -Last 5 # check error log