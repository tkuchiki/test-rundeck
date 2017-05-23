.PHONY:	clean

clean:
	rm -rf var/lib/mysql/* etc/rundeck/* var/rundeck/projects/* var/log/rundeck/* var/lib/rundeck/logs/* rundeck-nodes/.ssh

setup:
	mkdir -p etc/rundeck var/rundeck var/lib/rundeck/.ssh var/lib/rundeck/logs var/lib/rundeck/var/storage var/lib/mysql var/log/rundeck opt/rundeck-plugins
	chmod 700 var/lib/rundeck/.ssh
	ssh-keygen -f var/lib/rundeck/.ssh/id_rsa -t rsa -b 4096 -N ''
	chmod 600 var/lib/rundeck/.ssh/*
	cp -a var/lib/rundeck/.ssh/id_rsa.pub var/lib/rundeck/.ssh/authorized_keys
	cp -a var/lib/rundeck/.ssh rundeck-nodes/
	docker-compose build
