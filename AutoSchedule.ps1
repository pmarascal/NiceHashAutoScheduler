# ==================================================================================
# ==================================================================================
#
#					Nicehash Address AutoScheduler (v.20)
#								For Legacy & V2
#	
#					- For NiceHashLegacy and Nicehash V2
# ==================================================================================
# ==================================================================================
# 	Legacy Covers: 
#			ccminer, ethminer, excavator, nheqminer, sgminer, miner (ewbf)
#			xmr-stak-cpu, xmr-stak, NsGpuCNMiner, EthDcrMiner64, ZecMiner64,
#			Optiminer, prospector, xmrig
#
#			Donations 	BTC: 14thSNDnFBL8bA4D8AzVTaP1Xij9mVGSVr
#						LTC: LWBrYPG9ECqdq8a4UDc9jvTVpciPGZKin4
#	
# ==================================================================================
#			How To Setup & Use
# ==================================================================================
#	1) This script needs to be saved as a .ps1 file and placed into the 'Config'
#			folder of your Nicehash Setup (Legacy Folder, or /%appdata%/NHM2/Config)
#
#	2) Create an Addresses.txt file (also in /config/) that contains a list of BTC 
#			addresses, the app will read each line. So 1 address per line:
#						Address1
#						Address2
#						Address3
#
#	3) Edit Script For Your Configuration Using the Variables Below;
#			programName, Path, delay  (jsonPath is default if you placed in /config/)
#
#	4) Start Nicehash and make sure 'auto start mining' is ON;
#			Leave Open; can be mining or not at this point, it doesn't matter
#
#	5) Run the .ps1 Script; You should see it close the current Nicehash program and
#			any open mining windows. After some delay, it will restart with the first
#			address in the address.txt.  It will run that for however long your delay
#			is set, and then close/reopen again with the next address in the list, etc.
#
# ==================================================================================
# 			Configuration Variables
# ==================================================================================
# ==================================================================================
# 			Configuration Variables
# ==================================================================================
# Set this to 'NiceHash Miner 2' or 'NiceHashMinerLegacy'
$programName = "NiceHashMinerLegacy"
# Set to your install path of NiceHash Miner INCLUDING THE .EXE
$programPath = "C:\Users\Pete\Desktop\Nicehash Legacy 1.8.1.3\NiceHashMinerLegacy.exe"
# Set Path to Schedule.csv File
$SchedulePath = "C:\Users\Pete\Desktop\AutoScheduler\schedule.csv"
# Set Path to General.json (%appdata% Nicehash Config)
$jsonPath = "./General.json"
# ==================================================================================
#			Main Logic - Any Changes Below May Have Unexpected Results
# ==================================================================================


$CurrTime = Get-Date
$CurrTimeGMT = $CurrTime.ToUniversalTime()

"GMT Time = " + $CurrTimeGMT

Sleep 1


Read-Host -Prompt "Press Enter to exit"

$SchedulePath = "C:\Users\Pete\Desktop\AutoScheduler\schedule.csv"

$csv = Import-Csv -path $SchedulePath
$TotalRows = $csv.count
$i = 1

Write-Host "Total Rows in CSV: " $TotalRows

WHILE	($i -le $TotalRows)
{
	$iPlus = $i+1
	$Address = $($csv[$i].Address)
	$DateToStart = $($csv[$i].DateToStart)
	
	$NextDateToStart = $($csv[$iPlus].DateToStart)
	Write-Host "Address to Mine: " $Address
	Write-Host "Date to Start: " $DateToStart
	Write-Host "Date to Switch: " $NextDateToStart
	
	$i++
} 
<#ForEach ($Line in $csv)
{
	$Address = $($Line.Address)
	$DateToStart = $($Line.DateToStart)	
	
	$NextDateToStart = $($csv[2].DateToStart)
	Write-Host $DateToStart
	Write-Host $NextDateToStart
	
	#Get CurrDate & Convert to GMT
	$CurrTime = Get-Date
	$CurrTimeGMT = $CurrTime.ToUniversalTime()
	
	
	<#IF ($CurrTimeGMT -gt $DateToStart)
	{
		$CurrAddress  = $Address
		
		Write-Host "Restarting NiceHash and switching to: " $CurrAddress
		#invoke-expression -command .\NH_Manager.ps1
		#Close NH / Reopen w/ Address
	}
	ELSE
	{	
		#WHILE $CurrTimeGMT -gt $NextDateToStart
		Sleep 10
		Write-Host "Sleeping 10 Seconds"
	}
	
	#>
#}


Read-Host -Prompt "Press Enter to exit"