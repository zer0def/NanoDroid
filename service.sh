#!/system/bin/sh
while true; do [ "$(getprop sys.boot_completed)" = "1" ] && break; sleep 5; done;
_app=com.android.webview
pm list packages | grep -q "^package:${_app}$" || exit 0  # can't find our own package
_apk="$(pm list packages -f "${_app}" | sed 's|package:\(.*\)=[^=]*|\1|g')"
pm install -r "${_apk}"
