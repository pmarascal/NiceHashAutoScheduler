# ==================================================================================
# ==================================================================================
#
#					Nicehash Address AutoScheduler (v.10)
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
# Set this to 'NiceHash Miner 2' or 'NiceHashMinerLegacy'
$programName = "NiceHashMinerLegacy"
# Set to your install path of NiceHash Miner INCLUDING THE .EXE
$programPath = "C:\Users\Pete\Desktop\Nicehash Legacy 1.8.1.3\NiceHashMinerLegacy.exe"
# Set Path to General.json (%appdata% Nicehash Config)
$jsonPath = "./General.json"
# ==================================================================================
#			Main Logic - Any Changes Below May Have Unexpected Results
# ==================================================================================

$a = Get-Content $jsonPath -raw | ConvertFrom-Json
foreach($line in [System.IO.File]::ReadLines("./addresses.txt"))
{
	
	$Legacy = Get-Process NiceHashMinerLegacy -ErrorAction SilentlyContinue
	$NHM2	= Get-Process "NiceHash Miner 2" -ErrorAction SilentlyContinue
	if ($Legacy) 
	{
	  # try gracefully first
	  $Legacy.CloseMainWindow()
	  # kill after 3 seconds
	  Sleep 3
	  if (!$Legacy.HasExited) 
	  {
		$Legacy | Stop-Process -Force
	  }
	}
	if ($NHM2) 
	{
	  # try gracefully first
	  $NHM2.CloseMainWindow()
	  # kill after 3 seconds
	  Sleep 3
	  if (!$NHM2.HasExited) 
	  {
		$NHM2 | Stop-Process -Force
	  }
	}

	Start-Sleep -s 5
	
	
	########### Check For and Close All Possible Miner Processes ###########
	#Excavator
	$miner = Get-Process excavator -ErrorAction SilentlyContinue
	if ($miner) 
	{
	  # try gracefully first
	  $miner.CloseMainWindow()
	  # kill after 3 seconds
	  Sleep 3
	  if (!$miner.HasExited) 
	  {
		$miner | Stop-Process -Force
	  }
	}
	#xmr-Stak-CPU
	$miner = Get-Process xmr-stak-cpu -ErrorAction SilentlyContinue
	if ($miner) 
	{
	  # try gracefully first
	  $miner.CloseMainWindow()
	  # kill after 3 seconds
	  Sleep 3
	  if (!$miner.HasExited) 
	  {
		$miner | Stop-Process -Force
	  }
	}
	#xmrig
	$miner = Get-Process xmrig -ErrorAction SilentlyContinue
	if ($miner) 
	{
	  # try gracefully first
	  $miner.CloseMainWindow()
	  # kill after 3 seconds
	  Sleep 3
	  if (!$miner.HasExited) 
	  {
		$miner | Stop-Process -Force
	  }
	}
	# Xmr-Stak (GPU)
	$miner = Get-Process xmr-stak -ErrorAction SilentlyContinue
	if ($miner) 
	{
	  # try gracefully first
	  $miner.CloseMainWindow()
	  # kill after 3 seconds
	  Sleep 3
	  if (!$miner.HasExited) 
	  {
		$miner | Stop-Process -Force
	  }
	}
	# Equihash
	$miner = Get-Process miner -ErrorAction SilentlyContinue
	if ($miner) 
	{
	  # try gracefully first
	  $miner.CloseMainWindow()
	  # kill after 3 seconds
	  Sleep 3
	  if (!$miner.HasExited) 
	  {
		$miner | Stop-Process -Force
	  }
	}
	# Claymores Dual Miner
	$miner = Get-Process EthDcrMiner64 -ErrorAction SilentlyContinue
	if ($miner) 
	{
	  # try gracefully first
	  $miner.CloseMainWindow()
	  # kill after 3 seconds
	  Sleep 3
	  if (!$miner.HasExited) 
	  {
		$miner | Stop-Process -Force
	  }
	}
	# CCMiner
	$miner = Get-Process ccminer -ErrorAction SilentlyContinue
	if ($miner) 
	{
	  # try gracefully first
	  $miner.CloseMainWindow()
	  # kill after 3 seconds
	  Sleep 3
	  if (!$miner.HasExited) 
	  {
		$miner | Stop-Process -Force
	  }
	}
	# EthMiner
	$miner = Get-Process ethminer -ErrorAction SilentlyContinue
	if ($miner) 
	{
	  # try gracefully first
	  $miner.CloseMainWindow()
	  # kill after 3 seconds
	  Sleep 3
	  if (!$miner.HasExited) 
	  {
		$miner | Stop-Process -Force
	  }
	}
	# SGMiner
	$miner = Get-Process sgminer -ErrorAction SilentlyContinue
	if ($miner) 
	{
	  # try gracefully first
	  $miner.CloseMainWindow()
	  # kill after 3 seconds
	  Sleep 3
	  if (!$miner.HasExited) 
	  {
		$miner | Stop-Process -Force
	  }
	}
	#Optiminer
	$miner = Get-Process Optiminer -ErrorAction SilentlyContinue
	if ($miner) 
	{
	  # try gracefully first
	  $miner.CloseMainWindow()
	  # kill after 3 seconds
	  Sleep 3
	  if (!$miner.HasExited) 
	  {
		$miner | Stop-Process -Force
	  }
	}
	#ZCash Claymore Dual
	$miner = Get-Process ZecMiner64 -ErrorAction SilentlyContinue
	if ($miner) 
	{
	  # try gracefully first
	  $miner.CloseMainWindow()
	  # kill after 3 seconds
	  Sleep 3
	  if (!$miner.HasExited) 
	  {
		$miner | Stop-Process -Force
	  }
	}
	#prospector
	$miner = Get-Process prospector -ErrorAction SilentlyContinue
	if ($miner) 
	{
	  # try gracefully first
	  $miner.CloseMainWindow()
	  # kill after 3 seconds
	  Sleep 3
	  if (!$miner.HasExited) 
	  {
		$miner | Stop-Process -Force
	  }
	}
	#NsGpuCNMiner
	$miner = Get-Process NsGpuCNMiner -ErrorAction SilentlyContinue
	if ($miner) 
	{
	  # try gracefully first
	  $miner.CloseMainWindow()
	  # kill after 3 seconds
	  Sleep 3
	  if (!$miner.HasExited) 
	  {
		$miner | Stop-Process -Force
	  }
	}
	Remove-Variable miner

   $line
   $a.BitcoinAddress = "$line"
   $a | ConvertTo-Json  | set-content './General.json'
   Start-Process -FilePath $programPath
}