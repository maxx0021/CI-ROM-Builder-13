# sync rom
repo init --depth=1 --no-repo-verify -u https://github.com/Maxx12211/android_manifest -b tiramisu2 -g default,-mips,-darwin,-notdefault
repo sync -c --no-clone-bundle --no-tags --optimized-fetch --prune --force-sync -j16
#curl -s https://packagecloud.io/install/repositories/github/git-lfs/script.deb.sh | sudo bash
#sudo apt-get install git-lfs
#repo init --git-lfs
#rm -rf external/chromium-webview/prebuilt/*
#rm -rf .repo/projects/external/chromium-webview/prebuilt/*.git
#rm -rf .repo/project-objects/LineageOS/android_external_chromium-webview_prebuilt_*.git
#repo sync -j16
git clone --depth=1 https://github.com/Maxx12211/android_device_xiaomi_rova.git -b 13-cherish device/xiaomi/rova
git clone --depth=1 https://github.com/Maxx12211/android_vendor_xiaomi_rova.git -b 13 vendor/xiaomi/rova
git clone --depth=1 https://github.com/Maxx12211/android_kernel_xiaomi_rova.git -b 13.0 kernel/xiaomi/rova

# build rom
curl -Lo barom.sh https://raw.githubusercontent.com/alanndz/barom/main/barom.sh
chmod +x barom.sh
./barom.sh -t ${TG_CHAT_ID} ${TG_TOKEN}
./barom.sh --ccache-dir "${WORKDIR}/ccache" --ccache-size 20G
./barom.sh --device rova --lunch lineage_rova-userdebug
./barom.sh -b -j 8 -u gof --timer 95m -- mka bacon

# end
