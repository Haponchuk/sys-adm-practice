

cat passwd_backup | grep /bin/false \
	&& sed -i 's#/bin/false#/bin/bash#g' passwd_backup \
	&& echo "------------------------------" \
	&& grep "/bin/bash" passwd_backup

