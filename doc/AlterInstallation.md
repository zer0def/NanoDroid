Table of Contents
=================

   * [Alter Installation](#alter-installation)
      * [Configuration File](#configuration-file)
      * [Detailed Description](#detailed-description)
         * [nanodroid_fdroid](#nanodroid_fdroid)
         * [nanodroid_apps](#nanodroid_apps)
         * [nanodroid_overlay](#nanodroid_overlay)
         * [nanodroid_init](#nanodroid_init)
         * [nanodroid_forcesystemize](#nanodroid_forcesystemize)

Created by [gh-md-toc](https://github.com/ekalinin/github-markdown-toc)

# Alter Installation

## Configuration File

To alter the installation you can create the file `.nanodroid-setup` on your device, in one of the following directories:

* `/data/media/0` (internal storage **[TWRP]**)
* `/sdcard1` (internal storage **[ORANGEFOX]**)
* `/external_sd` (TWRP path to SD Card (if any))
* `/data` (fallback)
* `/system/addon.d/` (fallback if TWRP can't mount `/data`)
* `/tmp` (fallback if TWRP can't mount `/data`)

You can use the [default configuration file](.nanodroid-setup) as a starting point. Below follows its detailed description. If a required entry is missing from your configuration file, the default setting will be added to your configuration file.

## Detailed Description

### nanodroid_fdroid

**F-Droid** installation

**supported packages:** *Full package*, *F-droid package*

**Syntax:** `nanodroid_fdroid=1`, value can be 0 or 1:

* 0 = don't install F-Droid at all (**Note:** does not effect NanoDroid-FDroid package)
* 1 = install official F-Droid client (alongside priviledged extension)

### nanodroid_apps

Apps installation

**supported packages:** *Full package*

**Syntax:** `nanodroid_apps=1`, value can be 0 or 1:

* 0 = don't install applications
* 1 = install all applications listed in .nanodroid-apps file

see [> Applications](Applications.md) for detailed information

### nanodroid_overlay

whether to utilize the NanoDroid-Overlay to stub-debloat system applications in Magisk Mode, or force-debloat on System Mode

**supported packages:** *Full package*

**Syntax:** `nanodroid_overlay=1`, value can be 0 or 1:

* 0 = don't utilize NanoDroid-Overlay
* 1 = utilize NanoDroid-Overlay

see [> NanoDroid-Overlay](NanoDroidOverlay.md) for detailed information

### nanodroid_init

init scripts installation

**supported packages:** *Full package*

**Syntax:** `nanodroid_init="10_sqlite 20_fstrim"`

This setting is a list of init scripts, each listed item will be installed, possible values

```
10_sqlite
20_fstrim
30_logcat
40_external_sd
50_logscleaner
```

Leave an empty quote (`nanodroid_init=""`) to not install any init script

see [init-scripts](../README.md#init-scripts) for more information

### nanodroid_forcesystemize

Force systemized installation instrad of Magisk Module installation (if Magisk available)

**Note:** You shouldn't touch this settings unless you really know what you are doing.

**supported packages:** *Full*, *F-Droid*, *Bromite System WebView*, *OSM Android*

**Syntax:** `nanodroid_forcesystemize=0`, value can be 0 or 1:

* 0 = auto detect installation mode (default)
* 1 = force systemized installation
