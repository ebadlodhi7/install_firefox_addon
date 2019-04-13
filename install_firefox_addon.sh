#! /bin/bash
echo "";echo `date`;echo "firefoxのアドオンインストール。"
FFDIR="${HOME}/ffaddon_temp"
cd && rm -rf "${FFDIR}" && mkdir "${FFDIR}" && cd "${FFDIR}"|| exit 1

ADDON_LIST="firefox_add_on.txt"
#追加したいアドオンのURLをヒアドキュメントに記載する。
HOGE=$(cat << EOS
https://addons.mozilla.org/firefox/downloads/file/1672871/ublock_origin-1.18.4-an+fx.xpi
https://addons.mozilla.org/firefox/downloads/file/1669416/https_everywhere-2019.1.31-an+fx.xpi
https://addons.mozilla.org/firefox/downloads/file/864868/no_coin-0.4.13-an+fx.xpi
EOS
)
echo "${HOGE}" | sort | uniq > "${ADDON_LIST}"
if [ $? -gt 0 ]; then
   echo "アドオンリスト取得失敗。"
   exit 2
fi

while read line
do
   echo "Download:${line}"
   wget "${line}" || exit 3
done < "${ADDON_LIST}"

firefox *.xpi || exit 4
#firefox側でアドオンのインストール操作が必要なので-fなし。
cd && rm -r "${FFDIR}" || exit 5