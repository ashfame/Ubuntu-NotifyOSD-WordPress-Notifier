#!/bin/bash

# Current DIR http://stackoverflow.com/questions/59895/can-a-bash-script-tell-what-directory-its-stored-in
# PWD is not reliable as the script might be called from some other directory by providing the path and PWD will only work when you first cd into the current directory
DIR="$( cd -P "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

WPURL='http://blog.ashfame.com'
WPVERSION="`wget -qO- $WPURL/wp-admin/admin-ajax.php?action=wp_version`"

WPORG='http://api.wordpress.org/core/version-check/1.5/?version='$WPVERSION
RESULT="`wget -qO- $WPORG`"

#Typesetting http://www.linuxtopia.org/online_books/advanced_bash_scripting_guide/declareref.html
declare -a z
z=($RESULT)

if [ "${z[0]}" = 'upgrade'  ]; then
	NEWVER=${z[3]}
	notify-send -t 2000 -i $DIR/wp.png "WordPress $NEWVER released" "Update your installs now"
fi

exit

#
# Following code is only kept for reference (I am not a shell scripting nerd!)
#

# Working code (without version number) using a tmp file in user folder
<<COMMENT
wget -q -O /home/ashfame/wp-version-check.txt $URL
grep -i "upgrade" /home/ashfame/wp-version-check.txt
if [ $? -eq 0 ] ; then
DISPLAY=:0 notify-send -t 2000 -i /home/ashfame/Dropbox/Ubuntu/icons/wp.png "WordPress Version outdated!" "Please update!"
fi
rm /home/ashfame/wp-version-check.txt
COMMENT

# Working code using pipeline (but not sufficient to extract the version number from wget)
<<COMMENT1
wget -qO- $URL | grep "upgrade"
if [ $? -eq 0 ] ; then
DISPLAY=:0 notify-send -t 2000 -i /home/ashfame/Dropbox/Ubuntu/icons/wp.png "WordPress Version outdated!" "Please update!"
fi
COMMENT1
