# platform = multi_platform_ol
# reboot = false
# strategy = restrict
# complexity = low
# disruption = low

SIDlist=$(find /sapmnt -regex '^/sapmnt/[A-Z][A-Z0-9][A-Z0-9]$')

for i in $SIDlist ; do
	SID=${i:8:3}
	sidadm=$(echo "$SID" | sed -e 's/\(.*\)/\L\1/')adm
	if [ -d /sapmnt/$SID/exe ] ; then chown $sidadm /sapmnt/$SID/exe ; fi
        if [ -f /sapmnt/$SID/exe/saposcol ] ; then chown root /sapmnt/$SID/exe/saposcol ; fi
        if [ -f /sapmnt/$SID/exe/uc/*/saposcol ] ; then chown root /sapmnt/$SID/exe/uc/*/saposcol ; fi
        if [ -f /sapmnt/$SID/exe/nuc/*/saposcol ] ; then chown root /sapmnt/$SID/exe/nuc/*/saposcol ; fi
        if [ -f /usr/sap/hostctrl/exe/saposcol ] ; then chown root /usr/sap/hostctrl/exe/saposcol ; fi
        if [ -d /sapmnt/$SID/global ] ; then chown $sidadm /sapmnt/$SID/global ; fi
        if [ -d /sapmnt/$SID/profile ] ; then chown $sidadm /sapmnt/$SID/profile ; fi
	if [ -d /usr/sap/$SID ] ; then
		chown $sidadm /usr/sap/$SID
		find /usr/sap/$SID -regex '^/usr/sap/[A-Z][A-Z0-9][A-Z0-9]/\(DVEBMGS\|D\|JC\|J\|ASCS\|SCS\|ERS\)[0-9][0-9]$' -exec chown $sidadm {} \;
		find /usr/sap/$SID -regex '^/usr/sap/[A-Z][A-Z0-9][A-Z0-9]/\(DVEBMGS\|D\|JC\|J\|ASCS\|SCS\|ERS\)[0-9][0-9]/sec$' -exec chown $sidadm {} \;
		find /usr/sap/$SID -regex '^/usr/sap/[A-Z][A-Z0-9][A-Z0-9]/SYS$' -exec chown $sidadm {} \;
		# /usr/sap/SID/SYS/* (one-level) with symbolic link and link target
		find /usr/sap/$SID/SYS -maxdepth 1 -regex '^/usr/sap/[A-Z][A-Z0-9][A-Z0-9]/SYS/.+' -exec chown $sidadm {} \;
                find /usr/sap/$SID/SYS -maxdepth 1 -regex '^/usr/sap/[A-Z][A-Z0-9][A-Z0-9]/SYS/.+' -exec chown -h $sidadm {} \;
	fi
	if [ -d /usr/sap/trans ] ; then
		chown $sidadm /usr/sap/trans
		find /usr/sap/trans -maxdepth 1 -name "*" -exec chown $sidadm {} \;
	fi
        if [ -f /usr/sap/trans/.sapconf ] ; then chown $sidadm /usr/sap/trans/.sapconf ; fi
done
