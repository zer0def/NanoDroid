#!/bin/sh

OPENSSL_VERSION="${OPENSSL_VERSION:-3.2.0}"
curl -sSL "https://www.openssl.org/source/openssl-${OPENSSL_VERSION}.tar.gz" | tar xz
cd "openssl-${OPENSSL_VERSION}"
sed -i 's/-mandroid//' Configurations/15-android.conf

export CXXFLAGS="-std=c++11 -fPIC" CPPFLAGS="-DANDROID -fPIC" ANDROID_NDK="${ANDROID_NDK:-/opt/android-sdk/ndk/26.1.10909125}"
export ANDROID_NDK_HOME="${ANDROID_NDK}" ANDROID_NDK_ROOT="${ANDROID_NDK}" ANDROID_NDK_LATEST_HOME="${ANDROID_NDK}"

build_android_clang(){  # assumes arg3 is always gcc, which is kind of wrong
  OPENSSL_PLATFORM="android-${1}" ANDROID_API="${2}" TOOLCHAIN="${3:-llvm}"  #TOOLCHAIN="${3:+${3}${2}}"  # llvm
  if [ "${TOOLCHAIN}" = "llvm" ]; then
    export TOOLCHAIN_ROOT="${ANDROID_NDK_HOME}/toolchains/llvm/prebuilt/linux-$(uname -m)" \
    CC="clang" CXX="clang++"
  else
    export TOOLCHAIN_ROOT="${ANDROID_NDK_HOME}/toolchains/${3:+${TOOLCHAIN}-4.9}/prebuilt/linux-$(uname -m)" \
    CC="${3:+${TOOLCHAIN}-}clang" CXX="${3:+${TOOLCHAIN}-}clang++"
    #CC="${3:+${TOOLCHAIN}-}gcc" CXX="${3:+${TOOLCHAIN}-}g++"
  fi
  export AR="${TOOLCHAIN}-ar" \
         AS="${TOOLCHAIN}-as" \
         RANLIB="${TOOLCHAIN}-ranlib" \
         NM="${TOOLCHAIN}-nm" \
         STRIP="${TOOLCHAIN}-strip" \
         LD="${3:+${TOOLCHAIN}-}ld" \
         SYSROOT="${TOOLCHAIN_ROOT}/sysroot" \
         PATH="${TOOLCHAIN_ROOT}/bin${PATH:+:${PATH}}"

  OPENSSL3_OPTS="no-tests"  # ??, "duplicate symbol: time" when building tests
  make clean
  ./Configure --static -static -ffunction-sections -fdata-sections -Wl,--gc-sections "${OPENSSL_PLATFORM}" \
    no-shared threads no-asm no-sse2 no-ssl3-method no-ssl3 no-weak-ssl-ciphers no-ssl no-deprecated no-tls1 \
    no-tls1-method no-tls1_1 no-tls1_1-method no-tls1_2 no-tls1_2-method enable-tls1_3 no-rc2 no-rc4 no-idea no-seed \
    ${OPENSSL3_OPTS} ${ANDROID_API:+-D__ANDROID_API__=${ANDROID_API}}  #no-hw no-engine
  make -j${NPROC:-$(nproc)} build_generated
  #make -j${NPROC:-$(nproc)} apps  # ossl1.1
  make -j${NPROC:-$(nproc)} build_programs
  "${STRIP}" apps/openssl
}

#build_android_clang arm   21 #arm-linux-androideabi
build_android_clang x86   21 #i686-linux-android
#build_android_clang arm64 21 #aarch64-linux-android
