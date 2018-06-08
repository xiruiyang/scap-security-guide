# platform = multi_platform_ol
# reboot = false
# strategy = restrict
# complexity = low
# disruption = low
if [ -d /sapmnt ] ; then
	find /sapmnt -regex '^/sapmnt/[A-Z][A-Z0-9][A-Z0-9]/exe$' -exec chgrp sapsys {} \;
	find /sapmnt -regex '^/sapmnt/[A-Z][A-Z0-9][A-Z0-9]/exe/saposcol$' -exec chgrp sapsys {} \;
	find /sapmnt -regex '^/sapmnt/[A-Z][A-Z0-9][A-Z0-9]/global$' -exec chgrp sapsys {} \;
	find /sapmnt -regex '^/sapmnt/[A-Z][A-Z0-9][A-Z0-9]/profile$' -exec chgrp sapsys {} \;
fi
if [ -d /usr/sap ] ; then
	find /usr/sap -regex '^/usr/sap/[A-Z][A-Z0-9][A-Z0-9]$' -exec chgrp sapsys {} \;
	find /usr/sap -regex '^/usr/sap/[A-Z][A-Z0-9][A-Z0-9]/[DVEBMGS|D|JC|J|ASCS|SCS|ERS][0-9][0-9]$' -exec chgrp sapsys {} \;
	find /usr/sap -regex '^/usr/sap/[A-Z][A-Z0-9][A-Z0-9]/[DVEBMGS|D|JC|J|ASCS|SCS|ERS][0-9][0-9]/sec$' -exec chgrp sapsys {} \;
	find /usr/sap -regex '^/usr/sap/[A-Z][A-Z0-9][A-Z0-9]/SYS$' -exec chgrp sapsys {} \;
	find /usr/sap -maxdepth 3 -regex '^/usr/sap/[A-Z][A-Z0-9][A-Z0-9]/SYS/.+' -exec chgrp sapsys {} \;
	find /usr/sap -regex '^/usr/sap/trans$' -exec chgrp sapsys {} \;
        find /usr/sap -maxdepth 2 -regex '^/usr/sap/trans/' -exec chgrp sapsys {} \;
        find /usr/sap -regex '^/usr/sap/trans/.sapconf$' -exec chgrp sapsys {} \;
fi
