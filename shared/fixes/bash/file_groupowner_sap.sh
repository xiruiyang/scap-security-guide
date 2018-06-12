# platform = multi_platform_ol
# reboot = false
# strategy = restrict
# complexity = low
# disruption = low
find /sapmnt -regex '^/sapmnt/[A-Z][A-Z0-9][A-Z0-9]/exe$' -exec chgrp sapsys {} \;
find /sapmnt -regex '^/sapmnt/[A-Z][A-Z0-9][A-Z0-9]/exe/\(\|\(\|n\)uc/[A-Za-z0-9_]+/\)saposcol$' -exec chgrp sapsys {} \;
find /usr/sap -regex '^/usr/sap/hostctrl/exe/saposcol$' -exec chgrp sapsys {} \;
find /sapmnt -regex '^/sapmnt/[A-Z][A-Z0-9][A-Z0-9]/global$' -exec chgrp sapsys {} \;
find /sapmnt -regex '^/sapmnt/[A-Z][A-Z0-9][A-Z0-9]/profile$' -exec chgrp sapsys {} \;
find /usr/sap -regex '^/usr/sap/[A-Z][A-Z0-9][A-Z0-9]$' -exec chgrp sapsys {} \;
find /usr/sap -regex '^/usr/sap/[A-Z][A-Z0-9][A-Z0-9]/\(DVEBMGS\|D\|JC\|J\|ASCS\|SCS\|ERS\)[0-9][0-9]$' -exec chgrp sapsys {} \;
find /usr/sap -regex '^/usr/sap/[A-Z][A-Z0-9][A-Z0-9]/\(DVEBMGS\|D\|JC\|J\|ASCS\|SCS\|ERS\)[0-9][0-9]/sec$' -exec chgrp sapsys {} \;
find /usr/sap -regex '^/usr/sap/[A-Z][A-Z0-9][A-Z0-9]/SYS$' -exec chgrp sapsys {} \;
# /usr/sap/SID/SYS/* (one-level) with symbolic link and link target
find /usr/sap -regex '^/usr/sap/[A-Z][A-Z0-9][A-Z0-9]/SYS/.+' ! -regex '/usr/sap/[A-Z][A-Z0-9][A-Z0-9]/SYS/.+/.+' -exec chgrp sapsys {} \; 
find /usr/sap -regex '^/usr/sap/[A-Z][A-Z0-9][A-Z0-9]/SYS/.+' ! -regex '/usr/sap/[A-Z][A-Z0-9][A-Z0-9]/SYS/.+/.+' -exec chgrp -h sapsys {} \;
chgrp sapsys /usr/sap/trans
find /usr/sap/trans -maxdepth 1 -name "*" -exec chgrp sapsys {} \;
if [ -f /usr/sap/trans/.sapconf ] ; then chgrp sapsys /usr/sap/trans/.sapconf ; fi
