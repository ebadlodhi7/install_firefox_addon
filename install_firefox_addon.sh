#! /bin/bash
echo "";echo `date`;echo "firefox Add-on installation"
FFDIR="${HOME}/ffaddon_temp"
cd && rm -rf "${FFDIR}" && mkdir "${FFDIR}" && cd "${FFDIR}"|| exit 1

ADDON_LIST="firefox_add_on.txt"
#Enter the URL of the add-on you want to add in the here document.
HOGE=$(cat << EOS
https://addons.mozilla.org/firefox/downloads/file/864868/no_coin-0.4.13-an+fx.xpi
EOS
)
echo "${HOGE}" | sort | uniq > "${ADDON_LIST}"
if [ $? -gt 0 ]; then
   echo "Add-on list acquisition failure."
   exit 2
fi

while read line
do
   echo "Download:${line}"
   wget "${line}" || exit 3
done < "${ADDON_LIST}"

firefox *.xpi || exit 4
#firefox There is no -f because the add-on installation operation is required on the side.
cd && rm -r "${FFDIR}" || exit 5
