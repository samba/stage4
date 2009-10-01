README.txt	How to use Sam's Stage 4 system

PURPOSE:
	stage4 provides a fast, highly configurable, and scriptable snapshot
	backup of a system.	
	

REQUIREMENTS
	Programs:
		mksquashfs	(in gentoo package sys-fs/squashfs-tools)
		mkisofs		(in gentoo package app-cdr/cdrtools)
		md5sum
	Kernel mount support	(listed in /proc/filesystems)
		squashfs
		iso9660

	The Stage 4 scripts were designed to operate in a Gentoo Linux environment, 
	but intended to be generic enough to run on most any Linux distribution. 
	The above requirements are so few that most distributions should support
	these scripts without much difficulty. 
	
	The LiveCD used as the source for creating a Stage 4 boot cd MUST support 
	squashfs in the kernel.
	

CONFIGURATION
	Files: /etc/stage4/*

		global.conf	Sets any default values for the stage4 system
		<profile>/	
			profile.conf	Defines profile-specific variables
			**See profile "example"

	All configuration is done using the profiles. No command-line configuration 
	is necessary (although I'm working on ways to perform command-line
	configuration overrides).

	
COMMANDS
	stage4 <mode> <param1> <param2> ...


	Modes:
		archive	- create a stage4 archive (.squashfs)
		livecd	- create a bootable recovery cd (.iso)
		mount	- mount a stage4 archive (.squashfs)
		restore	- extract a stage4 archive to a mounted filesystem
		verify	- perform MD5 checksum verification on an archive
		support	- check required system support for stage4
		help	- display modes, parameters, and other usage info
		usage	- (same as 'help')

	Each mode requires unique parameters:
		archive	: <profile>
		livecd	: <profile>
		mount	: <stage4 archive> <mountpoint>
		restore	: <stage4 mountpoint> <destination mountpoint>
		verify	: <stage4 archive>
		support	: (none)
		help	: optional <mode>
		usage	: (same as 'help')


	All modes also support the "silent" parameter. This automatically
	assumes "yes" to all prompts/dialogs, and removes text formatting.
	This feature primarily facilitates scripting, using 'cron' jobs and
	similar schedulers. To create a monthly stage4 backup, a cron job
	could be formatted like so:
		0 3 1 * * stage4 archive systemprofile silent

	
