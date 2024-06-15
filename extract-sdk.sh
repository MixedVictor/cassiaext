#!/usr/bin/env sh

SDK=platform-tools-latest-linux.zip
NDK=android-ndk-r26d-linux.zip

ANDROID_SDK=/tmp/Android/Sdk
ANDROID_NDK=/tmp/Android/Sdk/ndk

mkdir /tmp/Android

unzip /tmp/$SDK -d /tmp/Android/ || exit 1
mv /tmp/Android/platform-tools $ANDROID_SDK || exit 1

unzip /tmp/$NDK -d $ANDROID_SDK || exit 1
mv $ANDROID_SDK/android-ndk-r26d $ANDROID_NDK || exit 1