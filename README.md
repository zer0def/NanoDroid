
Table of Contents
=================

   * [NanoDroid](#nanodroid)
   * [Table of Contents](#table-of-contents)
      * [Downloads](#downloads)
         * [SHA256 Checksum and GPG Signature](#sha256-checksum-and-gpg-signature)
         * [Snapshots](#snapshots)
      * [ChangeLog](#changelog)
      * [Summary](#summary)
      * [Details](#details)
      * [Installation](#installation)
      * [Issues](#issues)
      * [License &amp; Credits](#license--credits)

Created by [gh-md-toc](https://github.com/ekalinin/github-markdown-toc)

# NanoDroid

NanoDroid is an installer for various OpenSource projects, most noticably [Bromite WebView](https://bromite.org/), [F-Droid](https://f-droid.org/) and [OsmAnd](http://osmand.net/). It supports all Android 4.4+ phones and all partition layouts (System-as-root, A/B) and can be installed as a Magisk module. NanoDroid also includes additional features (system debloating, init scripts, automatic logcat creation).

Furthermore it allows the user to do fine-graded installations using configuration files to choose what to install, or if several alternatives are available, which of them. See [Installation](#installation) below.

**NanoDroid** was previously called **NanoMod** (before version 16.0).

## Downloads

Weekly builds are available on Gitlab: [![Latest Release](https://gitlab.com/zer0def/NanoDroid/-/badges/release.svg)](https://gitlab.com/zer0def/NanoDroid/-/releases)

### SHA256 Checksum and GPG Signature

Since version 18.3.1 all releases hosted on *nanolx.org* contain a SHA256 checksum and GPG signature to check their validity. AFH does provide the SHA256 checksum on the downloads summary page, but does not allow to upload a GPG signature.

You can verify the checksum with the public GPG key:

* download the public key from [photonic.asc](https://downloads.nanolx.org/NanoDroid/Stable/photonic.asc)
  * import it using `gpg --import photonic.asc`
* download and import using `gpg` from pgp.mit.edu:
  * `gpg --keyserver pgp.mit.edu --recv B0ABCE622A077B584B81339E340FD70EFFC52B26`


```bash
gpg --verify NanoDroid-19.0.20181027.zip.sha256.sig
sha256sum -c NanoDroid-19.0.20181027.zip.sha256
```

Additionally, you may want to ensure the signing date is close to the release date.

### Snapshots

You can create snapshots from this repository using the `build-package` script.

See the [build-package documentation](doc/BuildPackage.md) for more information.

## ChangeLog

Full, user-readible [> ChangeLog](ChangeLog.md)

## Summary

**NanoDroid** can be installed as a Magisk Module or directly systemized, most of the functionalities are available, in System Mode too.

More information about Magisk [> XDA](https://forum.xda-developers.com/apps/magisk)

NanoDroid includes

* [> F-Droid](https://f-droid.org) and it's privileged extension
* custom init scripts
* pseudo-debloat feature (Magisk Mode)
  * disables applications systemless-ly
  * pre-configured [> default settings](doc/NanoDroidOverlay.md)
* force-debloat feature (Sytem Mode)
  * moves applications out of the way to /data/media/0/nanodroid_backup/
  * pre-configured [> default settings](doc/NanoDroidOverlay.md)
* several Open Source applications
  * include replacements for the pseudo-debloated applications
  * full list of [> included applications](doc/Applications.md)
* additional components
  * Addon.d support for System Mode installation
     * restores NanoDroid after ROM update

## Details

See the [> Detail information](doc/Details.md) for full details on F-Droid, features and utilities included with NanoDroid.

## Installation

See the [Installation](doc/Installation.md) docs for instructions.

## Issues

See [the list of known issues](doc/Issues.md) and their respective fixes or workarounds.

## License & Credits

My own work (NanoDroid itself) is licensed under the GNU General Public License version 3 or newer [> GNU](https://www.gnu.org/licenses/gpl-3.0.txt).

For more details (including authors and license) on every provided application or Software press the link next to it.

Additional credits go to

* Mar-V-In for microG
  * https://github.com/microg
* topjohnwu for Magisk
  * https://github.com/topjohnwu/Magisk
* Lanchon for dexpatcher and haystack
  * https://github.com/dexpatcher
* osm0sis for GNU Nano and Busybox
  * https://forum.xda-developers.com/showthread.php?t=2239421
* shadow53 for automatic apk grabbing base code
  * https://shadow53.com/android/no-gapps/
* ale5000 for GApps Removal list and native signature spoofing detection
  * https://github.com/micro5k
* anestisb for vdexExtractor
  * https://github.com/anestisb/vdexExtractor
* JesusFreke for smali/baksmali
  * https://github.com/JesusFreke/smali
* Zackptg5 for zstd binaries
  * https://github.com/Zackptg5/Cross-Compiled-Binaries-Android

Special Thanks to the contributors (starting with most recent contribution)

* TanyaEleventhGoddess
  * various improvements and fixed for `build-package`
* Gia90
  * Android 6.0 support for Patcher
  * fixes for x86_64 support
* Vavun
  * OsmAnd package
  * several contributions to NanoDroid (and its former microG GmsCore fork)

Special Thanks to the beta testers

* xenithorb
* ShapeShifter499
