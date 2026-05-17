#!/system/bin/sh
until [ "$(getprop sys.boot_completed)." = "1." ]; do sleep 1; done
_app=com.android.webview  # should parameterize this somehow?
_entry="$(pm list packages -f --show-versioncode | grep "=${_app} ")"
_apk="${_entry%%=*}"
if [ "$(getprop ro.build.version.sdk)" -ge 34 ]; then
  _version="$(aapt2 dump xmltree --file AndroidManifest.xml "${_apk##*:}" | grep ':versionCode(')"
  _version="${_version##*=}"
else
  _version="$(aapt dump xmltree "${_apk##*:}" AndroidManifest.xml | grep ':versionCode(')"
  _version="$(printf '%d' "${_version##*)}")"
fi
sh -ec "[ -n '${_entry}' ] && [ '${_entry##*:}' = '${_version}' ]" || pm install -r "${_apk##*:}" || sh -c "pm uninstall '${_app}'; pm install -r '${_apk##*:}'"
