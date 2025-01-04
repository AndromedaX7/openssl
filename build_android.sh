[[ ! -f  "./Makefile" ]] || make clean
[[ ! -f  "./configdata.pm" ]] || rm -rf ./configdata.pm ./Makefile ./Makefile.in ./include/openssl/configuration.h

export API_LEVEL=26
export TOOLCHAIN=$ANDROID_NDK_ROOT/toolchains/llvm/prebuilt/linux-x86_64/bin
PATH=$TOOLCHAIN:$PATH
echo $PATH
echo $ANDROID_NDK_ROOT
if [[ $1 == "arm" ]]; then
export BUILD_ABI=android-arm
elif [[ $1 == "aarch64" ]]; then
export BUILD_ABI=android-arm64
elif [[ $1 == "x86" ]]; then
export BUILD_ABI=android-x86
elif [[ $1 == "x86_64" ]]; then
export BUILD_ABI=android-x86_64
fi

./Configure $BUILD_ABI -D__ANDROID_API__=$API_LEVEL no-asm  no-shared  --prefix=$HOME/openssl_$BUILD_ABI

make -j$(nproc)
make install

