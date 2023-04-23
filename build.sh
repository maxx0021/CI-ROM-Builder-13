# sync rom
repo init --depth=1 --no-repo-verify -u https://github.com/RisingTechOSS/android.git -b thirteen -g default,-mips,-darwin,-notdefault
repo sync -c --no-clone-bundle --no-tags --optimized-fetch --prune --force-sync -j16
git clone --depth=1 https://github.com/Maxx12211/device_xiaomi_rova.git -b a13-risingos device/xiaomi/rova
git clone --depth=1 https://github.com/Maxx12211/vendor_xiaomi_rova.git -b a13 vendor/xiaomi/rova
git clone --depth=1 https://github.com/Maxx12211/android_kernel_xiaomi_msm8937.git -b a13/master kernel/xiaomi/msm8937

# build rom
mv hardware/lineage/compat/Android.bp hardware/lineage/compat/Android.bpp
curl -Lo barom.sh https://raw.githubusercontent.com/Maxx12211/barom/main2/barom.sh
chmod +x barom.sh
./barom.sh -t ${TG_CHAT_ID} ${TG_TOKEN}
./barom.sh --ccache-dir "${WORKDIR}/ccache" --ccache-size 20G
./barom.sh --device rova --lunch cherish_rova-userdebug
./barom.sh -b -j 8 -u gof --timer 95m -- mka bacon

# end
