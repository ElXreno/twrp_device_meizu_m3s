git clone https://gitlab.com/ElXreno/android-5.1-src /build
cd /build
mkdir -p device/meizu/m3s && cp -r /sources/* device/meizu/m3s/
source build/envsetup.sh && lunch omni_m3s-eng && make -j5 recoveryimage
cp /build/out/target/product/m3s/recovery.img /sources/recovery.img
