# sync rom
repo init --depth=1 --no-repo-verify -u https://github.com/alphadroid-project/manifest -b alpha-13 --git-lfs -g default,-mips,-darwin,-notdefault
repo sync -c --no-clone-bundle --no-tags --optimized-fetch --prune --force-sync -j16
curl -s https://packagecloud.io/install/repositories/github/git-lfs/script.deb.sh | sudo bash
sudo apt-get install git-lfs
repo init --git-lfs
rm -rf external/chromium-webview/prebuilt/*
rm -rf .repo/projects/external/chromium-webview/prebuilt/*.git
rm -rf .repo/project-objects/LineageOS/android_external_chromium-webview_prebuilt_*.git
repo sync -c --no-clone-bundle --no-tags --optimized-fetch --prune --force-sync -j16
git clone --depth=1 https://github.com/Maxx12211/android_device_xiaomi_rova.git -b alpha2-13 device/xiaomi/rova
git clone --depth=1 https://github.com/Maxx12211/android_vendor_xiaomi_rova.git -b 13.0 vendor/xiaomi/rova
git clone --depth=1 https://github.com/iusmac/kernel_rova.git -b 13-dev kernel/xiaomi/rova

# build rom
mv hardware/lineage/compat/Android.bp hardware/lineage/compat/Android.bpp
curl -Lo barom.sh https://raw.githubusercontent.com/Maxx12211/barom/main2/barom.sh
chmod +x barom.sh
./barom.sh -t ${TG_CHAT_ID} ${TG_TOKEN}
./barom.sh --ccache-dir "${WORKDIR}/ccache" --ccache-size 20G
./barom.sh --device rova --lunch lineage_rova-userdebug
./barom.sh -b -j 8 -u gof --timer 60m -- mka bacon

# end
