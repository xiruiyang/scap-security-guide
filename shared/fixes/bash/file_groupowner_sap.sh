# platform = multi_platform_ol
# reboot = false
# strategy = restrict
# complexity = low
# disruption = low
find /sapmnt -regex '^/sapmnt/[A-Z][A-Z0-9][A-Z0-9]/exe$' -exec chgrp sapsys {} \;
find /sapmnt -regex '^/sapmnt/[A-Z][A-Z0-9][A-Z0-9]/exe/saposcol$' -exec chgrp sapsys {} \;
find /sapmnt -regex '^/sapmnt/[A-Z][A-Z0-9][A-Z0-9]/global$' -exec chgrp sapsys {} \;
find /sapmnt -regex '^/sapmnt/[A-Z][A-Z0-9][A-Z0-9]/profile$' -exec chgrp sapsys {} \;
find /usr/sap -regex '^/usr/sap/[A-Z][A-Z0-9][A-Z0-9]$' -exec chgrp sapsys {} \;
find /usr/sap -regex '^/usr/sap/[A-Z][A-Z0-9][A-Z0-9]/[DVEBMGS|D|JC|J|ASCS|SCS|ERS][0-9][0-9]$' -exec chgrp sapsys {} \;
find /usr/sap -regex '^/usr/sap/[A-Z][A-Z0-9][A-Z0-9]/[DVEBMGS|D|JC|J|ASCS|SCS|ERS][0-9][0-9]/sec$' -exec chgrp sapsys {} \;
find /usr/sap -regex '^/usr/sap/[A-Z][A-Z0-9][A-Z0-9]/SYS$' -exec chgrp sapsys {} \;
find /usr/sap -regex '^/usr/sap/[A-Z][A-Z0-9][A-Z0-9]/SYS/.+' ! -regex '/usr/sap/[A-Z][A-Z0-9][A-Z0-9]/SYS/.+/.+' -exec chgrp sapsys {} \;
chgrp sapsys /usr/sap/trans
chgrp sapsys /usr/sap/trans/*
chgrp sapsys /usr/sap/trans/.sapconf
