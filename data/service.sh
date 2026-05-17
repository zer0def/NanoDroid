#!/system/bin/sh

MODDIR="${0%/*}"
MODULE="$(basename "${MODDIR}")"

run_initscripts () {
	# wait until boot completed
	until [ `getprop vold.post_fs_data_done`. = 1. ]; do sleep 1; done

	# Set current date in 20170607-12.07.25 format
	CURDATE="$(date +%Y%m%d-%H.%M.%S)"

	# Create private Log directory
	LOGDIR="${MODDIR}/logs"

	[[ ! -d "${LOGDIR}" ]] && mkdir -p "${LOGDIR}"

	# NanoDroid init scripts
	for init in 10_sqlite 20_fstrim 30_logcat 40_external_sd 50_logscleaner; do
		if [ -f "${MODDIR}/init.d/${init}" ]; then
			"${MODDIR}/init.d/${init}" | tee -a "${LOGDIR}/${init}.log.${CURDATE}" &
		fi
	done
}

install_webview () {
	# wait until boot completed
	until [ "$(getprop sys.boot_completed)." = "1." ]; do sleep 1; done
	_app="${1:-com.android.webview}"
	_entry="$(pm list packages -f --show-versioncode | grep "=${_app} ")"
	_apk="${_entry%%=*}"
	_aapt2="$(command -v aapt2 || "${MODDIR}/system/bin/aapt2")"
	_aapt="$(command -v aapt || "${MODDIR}/system/bin/aapt")"
	if [ "$(getprop ro.build.version.sdk)" -ge 34 ]; then
		_version="$("${_aapt2}" dump xmltree --file AndroidManifest.xml "${_apk##*:}" | grep ':versionCode(')"
		_version="${_version##*=}"
	else
		_version="$("${_aapt}" dump xmltree "${_apk##*:}" AndroidManifest.xml | grep ':versionCode(')"
		_version="$(printf '%d' "${_version##*)}")"
	fi
	sh -ec "[ -n '${_entry}' ] && [ '${_entry##*:}' = '${_version}' ]" || pm install -r "${_apk##*:}" || sh -c "pm uninstall '${_app}'; pm install -r '${_apk##*:}'"
}

case "${MODULE}" in
	NanoDroid )
		run_initscripts &
	;;

	NanoDroid_AOSmiumWebView )
		install_webview org.axpos.aosmium_wv &
	;;

	NanoDroid_CromiteWebView )
		install_webview com.android.webview &
	;;

	* )
		exit 0
	;;
esac
