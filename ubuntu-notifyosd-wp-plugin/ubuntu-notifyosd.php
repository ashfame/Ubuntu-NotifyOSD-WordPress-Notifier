<?php
/*
Plugin Name: Ubuntu NotifyOSD WP Listener
Plugin URI: https://github.com/ashfame/Ubuntu-NotifyOSD-WordPress-Notifier
Description: Listener for the WordPress install
Author: Ashfame
Version: 0.1
Author URI: http://blog.ashfame.com
*/

/**
 * Function to return the version of WordPress
 *
 * URL: wp-admin/admin-ajax.php?action=wp_version
 *
 */

add_action( 'wp_ajax_nopriv_wp_version', 'unosd_wp_version' );

function unosd_wp_version() {
	global $wp_version;
	echo $wp_version;
	die();
}

/**
 * Function to return no of comments pending in moderation
 *
 * URL: wp-admin/admin-ajax.php?action=pending_comments_count
 */

add_action( 'wp_ajax_nopriv_pending_comments_count', 'unosd_pending_comments_count' );

function unosd_pending_comments_count() {
	//global $wpdb;
	$comments_count = wp_count_comments();
	echo $comments_count->moderated;
	die();
}

// Will add tons of stuff once I have some time & I figure out how to run a listener. Eventually, I would like to make it work in realtime.
