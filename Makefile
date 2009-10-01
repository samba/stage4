install:
	rsync $(PWD)/scripts/ /usr/local/bin/ -avP
	mkdir -p /etc/stage4
	rsync $(PWD)/config/ /etc/stage4/ -avP
