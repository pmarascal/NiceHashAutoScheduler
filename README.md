# NiceHashAutoScheduler
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
