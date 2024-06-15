### Cassiapp Externals

These are externally compiled components of [Cassiapp](https://github.com/cassia-org/cassiapp), unlike Cassia runtimes they aren't user-replaceable and are supposed to be tied to a specific version of the app.

#### Building
* Run `apply-patches.sh` in the `deps` folder
* Create build stuff (remember to replace `NDK_VERSION_HERE` with the currently installed one)
```
clear;cmake -GNinja -Bbuild -H. -DCMAKE_TOOLCHAIN_FILE=$HOME/Android/Sdk/ndk/NDK_VERSION_HERE/build/cmake/android.toolchain.cmake -DANDROID_ABI=arm64-v8a -DANDROID_PLATFORM=android-29 -DANDROID_SDK=$HOME/Android/Sdk -DANDROID_NDK=$HOME/Android/Sdk/ndk/NDK_VERSION_HERE/ -DANDROID_ABIS=arm64-v8a
```
* Build cassiaext
```
clear;cmake --build . -v
```
