[[ ! -f  "./Makefile" ]] || make clean
[[ ! -f  "./configdata.pm" ]] || rm -rf ./configdata.pm ./Makefile ./Makefile.in ./include/openssl/configuration.h
