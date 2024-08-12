#!/usr/bin/env bash


tar zxvf softcas_linux.tar.gz
cd softcas_linux
make

cp libpcsclite.so.1.0.0 /usr/lib/x86_64-linux-gnu/libpcsckai.so
sed '/Libs:/s|lpcsclite|lpcsckai|' \
   /usr/lib/arm-linux-gnueabihf/pkgconfig/libpcsclite.pc  \
   >/usr/lib/arm-linux-gnueabihf/pkgconfig/libpcsckai.pc


cd /opt/node_modules/arib-b25-stream-test/src
sed -i 's|libpcsclite|libpcsckai|'  Makefile
make all
make install

cd /app
git clone --depth 1 https://github.com/tsukumijima/libaribb25.git
cd libaribb25
mkdir build
cd build
cmake -DWITH_PCSC_PACKAGE=NO -DWITH_PCSC_LIBRARY=pcsckai ..
make install
cp /usr/local/bin/arib-b25-stream-test /opt/bin/arib-b25-stream-test
cd /app


echo end
