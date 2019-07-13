mkdir /build && cd /build

repo init --depth=1 -u git://github.com/minimal-manifest-twrp/platform_manifest_twrp_omni.git -b twrp-6.0 
repo sync -c -j$(nproc) --force-sync --no-clone-bundle --no-tags

mkdir -p device/meizu/m3s 
cp -r /sources/* device/meizu/m3s/

source build/envsetup.sh 
lunch omni_m3s-eng 
make -j$(nproc) recoveryimage

cp /build/out/target/product/m3s/recovery.img /sources/recovery.img
