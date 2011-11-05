Ubuntu NotifyOSD WordPress Notifier
===================================

It will check with the version of your WordPress install & compare it with the latest version and will notify you to upgrade your install.

![](https://github.com/ashfame/Ubuntu-NotifyOSD-WordPress-Notifier/raw/master/screenshots/ubuntu-notifyosd-wp-upgrade.png)

Right now, I run it by setting it up as a cron job for every 10 minutes.

How to set it up?
-----------------

* Copy the folder ```ubuntu-notifyosd-wp-plugin``` to your plugins folder of your WordPress install ```(wp-admin/plugins/)```.
* Activate the plugin.
* And then copy the other folder ```ubuntu-notify-osd-script``` somewhere where you will like to keep it (In a scripts folder under your home directory perhaps?).
* open the script ```wp-version-check.sh``` for editing, change the URL of your WordPress install WPURL
* Setup the cronjob for the script by ```crontab -e```
* At the end of the file, add ```*/10 * * * * /path/to/wp-version-check.sh```
* Press ```Ctrl``` + ```X``` to exit. Press ```y``` to save the changes you made.
* That's it


What's more to come?
--------------------

I intend to make it work in realtime & not by polling every few minutes. But that's something out of my skillset right now.

Other than upgrade notifications, I see scope of the following:

* Notification of user registrations
* Comments (pending/approval)
* Plugin or Theme updates
* Provide API so that custom events notification can be pushed to the user
