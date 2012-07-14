#!/bin/bash

# Change your WordPress URL here
# If your WordPress files reside in a sub-directory instead of domain root and you have your WP URL configured for the root, then you need to add the sub-directory too. Eg: http://blog.ashfame.com/wordpress
# Don't add a trailing slash at the end of the URL
WPURL='http://blog.ashfame.com'

# OS Choice: UBUNTU, MAC
OSTYPE='UBUNTU'

WPVERSION="`wget -qO- $WPURL/wp-admin/admin-ajax.php?action=wp_version`"

# Current DIR http://stackoverflow.com/questions/59895/can-a-bash-script-tell-what-directory-its-stored-in
# PWD is not reliable as the script might be called from some other directory by providing the path and PWD will only work when you first cd into the current directory
DIR="$( cd -P "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

WPORG='http://api.wordpress.org/core/version-check/1.5/?version='$WPVERSION
RESULT="`wget -qO- $WPORG`"

#Typesetting http://www.linuxtopia.org/online_books/advanced_bash_scripting_guide/declareref.html
declare -a z
z=($RESULT)

if [ "${z[0]}" = 'upgrade'  ]; then

	NEWVER=${z[3]}

	if [[ $OSTYPE =~ MAC ]]; then
		growlnotify --image wp.png WordPress Notifyer -m "WordPress $NEWVER released" "Update your installs now"
	fi

	if [[ $OSTYPE =~ UBUNTU ]]; then
		notify-send -t 2000 -i $DIR/wp.png "WordPress $NEWVER released" "Update your installs now"
	fi

fi

exit
