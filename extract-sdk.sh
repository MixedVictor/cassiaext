#!/usr/bin/env sh

SDK=commandlinetools-linux-11076708_latest.zip
NDK=android-ndk-r26d-linux.zip

ANDROID=/tmp/Android
ANDROID_SDK=$ANDROID/Sdk
ANDROID_NDK=$ANDROID_SDK/ndk

mkdir $ANDROID

unzip /tmp/$SDK -d $ANDROID
mv $ANDROID/cmdline-tools $ANDROID_SDK

unzip /tmp/$NDK -d $ANDROID_SDK
mv $ANDROID_SDK/android-ndk-r26d $ANDROID_NDK 