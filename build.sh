#!/usr/bin/env sh

SDK_PATH=/opt/android-sdk
NDK_VER=26.3.11579264
NDK_PATH=$SDK_PATH/ndk/$NDK_VER

# In case if build folder doesn't exist (in case if you're running outside the cassiaext folder) exit program
[[ -d "build" ]] && rm -rf build    || exit 1
clear;cmake -GNinja -Bbuild -H.                                                     \
            -DCMAKE_TOOLCHAIN_FILE=$NDK_PATH/build/cmake/android.toolchain.cmake    \
            -DANDROID_PLATFORM=android-29                                           \
            -DANDROID_ABI=arm64-v8a                                                 \
            -DANDROID_SDK=$SDK_PATH                                                 \
            -DANDROID_NDK=$NDK_PATH &&                                              \
            cd build                || exit 1

clear;cmake --build .               || exit 1