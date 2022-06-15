Table of Contents
=================

* [Modules](#modules)
* [Extra Packages](#extra-packages)

Created by [gh-md-toc](https://github.com/ekalinin/github-markdown-toc)

# Modules

Module packages: flash through TWRP or Magisk Manager

**NanoDroid**: includes
  * everything mentioned in the Summary

**NanoDroid-fdroid**: includes (only)
  * F-Droid and its privileged extension

**NanoDroid-BromiteWebView**: includes (only)
  * [Bromite WebView](https://www.bromite.org/system_web_view)

**NanoDroid-OsmAnd**: includes (only)
  * [OsmAnd](https://f-droid.org/de/packages/net.osmand.plus/)
  * [OsmAnd Contour Lines plugin](https://f-droid.org/de/packages/net.osmand.srtmPlugin.paid/)

# Extra Packages

Extra packages, flash through TWRP or Magisk Manager

**NanoDroid-systest**:
  * system testing script which will create the logfile as `/data/media/0/nanodroid_logs/NanoDroid-SysTest-TESTDATE.log`
     * TESTDATE is the date of testrun in %Y%m%D_%H.%M.%S format (eg: 20180709_20.34.14).
  * the following data is collected:
     * device profile (ROM, manufacturer, device, ABI, builddate, security patch date)
     * detected LD_LIBRARY_PATH
     * DalvikVM binary and it's architecture
     * mounted partitions, whether device is A/B
     * list of installed GApps
     * file list of /system/app and /system/priv-app
     * whether the ROM has native signature spoofing support
     * whether the ROM supports Bromite WebView installations
     * more (not **no** personal information)
  * use this to provide additional informations when posting issues

**NanoDroid-uninstaller**:
  * uninstalls *all* NanoDroid Magisk Modules
  * uninstalls NanoDroid installed in System Mode
  * uninstalls NanoDroid-Patcher addon.d environment
  * restores GApps and location services auto-removed during installation (System Mode)
  * restores `services.jar` patched by NanoDroid-Patcher (System Mode)
