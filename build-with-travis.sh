mkdir /build && cd /build
repo init --depth=1 -u git://github.com/ElXreno/platform_manifest_twrp_omni.git -b twrp-5.1 && repo sync
rm -rf .repo && find . -type d -name ".git" -exec rm -rf {} \;
mkdir -p device/meizu/m3s && cp -r /sources/* device/meizu/m3s/
source build/envsetup.sh && lunch omni_m3s-eng && make -j5 recoveryimage
cp /build/out/target/product/m3s/recovery.img /sources/recovery.img
