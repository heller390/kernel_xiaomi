make O=out ARCH=arm64 beryllium_defconfig

PATH="/home/darknecromonger/halium/prebuilts/clang/host/linux-x86/clang-4691093/bin:/home/darknecromonger/halium/prebuilts/gcc/linux-x86/aarch64/aarch64-linux-android-4.9/bin:/home/darknecromonger/halium/prebuilts/gcc/linux-x86/arm/arm-linux-androideabi-4.9/bin:${PATH}" \
make -j$(nproc --all) O=out \
                      ARCH=arm64 \
                      CC=clang \
                      CLANG_TRIPLE=aarch64-linux-gnu- \
                      CROSS_COMPILE=aarch64-linux-android- \
                      CROSS_COMPILE_ARM32=arm-linux-androideabi-
                      
# Pack AnyKernel3
rm -rf kernelzip
mkdir kernelzip
cp -rp ~/toolchain/anykernel3/* kernelzip/
cd kernelzip/
7z a -mx9 arter97-tmp.zip *
7z a -mx0 arter97-tmp.zip ../out/arch/arm64/boot/Image.gz-dtb
zipalign -v 4 arter97-tmp.zip ../arter97.zip
rm arter97-tmp.zip
cd ..
ls -al arter97.zip
