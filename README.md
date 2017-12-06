# NiceHashAutoScheduler

Powershell script that can be used to automatically switch between BTC Addresses in the Nicehash Mining program. It can either be used with a schedule.csv file that uses timestamps, or with a simple delay timer between an addresses.txt file.

 	Covers Nicehash V2 and Legacy Covering The Following Miners: 
		ccminer, ethminer, excavator, nheqminer, sgminer, miner (ewbf)
		xmr-stak-cpu, xmr-stak, NsGpuCNMiner, EthDcrMiner64, ZecMiner64,
		Optiminer, prospector, xmrig

It was developed as part of a Secret Santa group sharing hash power during the Holiday season. This program can be used for any purposes you see fit. There is absolutely no need to donate a thing, just enjoy and hope that it helps for whatever project you have in mind.

	Donations 	BTC: 14thSNDnFBL8bA4D8AzVTaP1Xij9mVGSVr
			LTC: LWBrYPG9ECqdq8a4UDc9jvTVpciPGZKin4

 ========================================================================
#			How To Setup & Use
 ========================================================================
 
 
	1) This script needs to be saved as a .ps1 file and placed into the 'Config'
			folder of your Nicehash Setup (Legacy Folder, or /%appdata%/NHM2/Config)

	2) Create an Addresses.txt file (also in /config/) that contains a list of BTC 
			addresses, the app will read each line. So 1 address per line:
						Address1
						Address2
						Address3

	3) Edit Script For Your Configuration Using the Variables Below;
			programName, Path, delay  (jsonPath is default if you placed in /config/)

	4) Start Nicehash and make sure 'auto start mining' is ON;
			Leave Open; can be mining or not at this point, it doesn't matter

	5) Run the .ps1 Script; You should see it close the current Nicehash program and
			any open mining windows. After some delay, it will restart with the first
			address in the address.txt.  It will run that for however long your delay
			is set, and then close/reopen again with the next address in the list, etc.
