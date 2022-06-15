Table of Contents
=================

   * [Issues](#issues)
      * [F-Droid](#f-droid)
      * [Other](#other)
         * [Alarm Clock not ringing](#alarm-clock-not-ringing)
         * [Applications crash with Bromite WebView](#applications-crash-with-bromite-webview)
         * [Applications can't access storage / permission issues](#applications-cant-access-storage--permission-issues)

Created by [gh-md-toc](https://github.com/ekalinin/github-markdown-toc)

# Issues

## F-Droid

On some ROMs (most noticeably MIUI ROMs), F-Droid can't install applications. This is because F-Droid's Priviledged Extension is not compatible with those ROMs: 
* Disable it from F-Droid > Settings > Expert Settings > Privileged Extension

## Other

### Alarm Clock not ringing

* Due to changes in Android, to ensure your Alarm Clock is actually waking you up, you need Android to ignore battery optimization for it, to do so:
  * go to System Settings > Apps > Special Access > Battery Optimization > All Apps
  * tap on your Alarm Clock, for example `Alarmio` and choose `don't optimize`

### Applications crash with Bromite WebView

* install Bromite WebView as user-app, as root, on-device, issue:
  * `pm install -r /system/app/BromiteWebView/BromiteWebView.apk`
  * this is done automatically in Magisk Mode (as of version 20.5)

### Applications can't access storage / permission issues

* if your Applications can't access storage or have other permission issues, do the following:
  * from TWRP remove the file `/data/system/users/0/runtime-permissons.xml`
  * or run the following command as root while in ROM: `pm reset-permissions`
* and reboot
