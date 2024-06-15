### Cassiapp Externals

These are externally compiled components of [Cassiapp](https://github.com/cassia-org/cassiapp), unlike Cassia runtimes they aren't user-replaceable and are supposed to be tied to a specific version of the app.

#### Building
* Run `apply-patches.py` in the `deps` folder to patch the dependencies
* Run CMake to create build stuff
```
clear;cmake -GNinja -Bbuild -H. -DCMAKE_TOOLCHAIN_FILE=/opt/android-sdk/ndk/26.3.11579264/build/cmake/android.toolchain.cmake -DANDROID_ABI=arm64-v8a -DANDROID_PLATFORM=android-29 -DANDROID_SDK=/opt/android-sdk -DANDROID_NDK=/opt/android-sdk/ndk/26.3.11579264/ -DANDROID_ABIS=arm64-v8a
```
* Build cassiaext
```
clear;cmake --build .
```