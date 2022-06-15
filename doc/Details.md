Table of Contents
=================

   * [NanoDroid](#nanodroid)
      * [NanoDroid-Overlay](#nanodroid-overlay)
      * [init scripts](#init-scripts)
      * [F-Droid](#f-droid)
      * [Applications](#applications)

Created by [gh-md-toc](https://github.com/ekalinin/github-markdown-toc)

# NanoDroid

This lists unique NanoDroid features.

## NanoDroid-Overlay

The `nanodroid-overlay` script handles the debloat feature

* pseudo-debloat applications in Magisk Mode
* force-debloat applications in System Mode
* show the list of debloated apps
* show the list of non-debloated apps
* add or remove apps from the list of debloated apps

Full details on the NanoDroid-Overlay Script [> Details](NanoDroidOverlay.md)

## init scripts

The following init scripts are bundled with NanoDroid

* external_sd
  * symlink SD Card mount point to `/external_sd`
  * SD Card needs to be inserted upon boot
* fstrim
  * trim file systems (may increase speed)
* logcat
  * store logcat in /data/adb/logcats
     * logs older than 7 days are deleted on every reboot
* logscleaner
  * clean up system log files older than 7 days
* sqlite
  * clean up sqlite databases

When in Magisk Mode the init scripts create their log files in

`/magisk/NanoDroid/logs/${script}.log.${date}`

When installed to /system your ROM needs to support running scripts in `/system/etc/init.d` or you can use **Kernel Adiutor's** init.d emulation.

## F-Droid

F-Droid [> Website](http://www.fdroid.org) is an app store for FOSS (Free and Open Source Software) applications only.

NanoDroid includes both F-Droid and it's Privileged Extension [> F-Droid](https://f-droid.org/repository/browse/?fdfilter=f-droid&fdid=org.fdroid.fdroid.privileged), so you don't need to enable `Unknown Sources`.

Furthermore NanoDroid tells F-Droid to activate the following additional repositories by default:

* NanoDroid companion F-Droid repository [> Link](https://www.nanolx.org/fdroid/repo)
* BromiteWebView F-Droid repository [> Link](https://www.bromite.org/fdroid)
* official microG F-Droid repository [> Link](https://microg.org/fdroid.html)

## Applications

NanoDroid includes a variety of OpenSource applications, check full [> list of applications](Applications.md).
