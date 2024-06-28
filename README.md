### Cassiapp Externals

These are externally compiled components of [Cassiapp](https://github.com/cassia-org/cassiapp), unlike Cassia runtimes they aren't user-replaceable and are supposed to be tied to a specific version of the app.

#### Cloning
* You can clone this repository using `git clone --recursive` or cloning normally and then updating the submodules with `git submodule update --init --recursive`

#### Building
* Run `reset-deps.py` and then `apply-patches.py` in the `deps` folder to patch the dependencies
* Run `build.sh` to build cassiaext
