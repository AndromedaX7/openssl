[[ ! -f  "./Makefile" ]] || make clean
[[ ! -f  "./configdata.pm" ]] || rm -rf ./configdata.pm ./Makefile ./Makefile.in ./include/openssl/configuration.h

source $HOME/emsdk/emsdk_env.sh

emconfigure ./Configure linux-generic32 no-asm no-shared no-threads no-dso no-engine no-tests --prefix=../openssl_wasm --openssldir=../openssl_wasm


emmake make CC=emcc AR=emar CXX=em++ STRIP=emstrip RANLIB=emranlib -j14

emmake make CC=emcc AR=emar CXX=em++ STRIP=emstrip RANLIB=emranlib install
