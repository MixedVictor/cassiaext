# Credits to https://github.com/xtruder/nix-devcontainer :D
FROM ghcr.io/xtruder/nix-devcontainer:latest

ARG REPO_URL=https://dl.google.com/android/repository

ARG SDK=platform-tools-latest-linux.zip
ARG NDK=android-ndk-r26d-linux.zip

ADD --chown=code:code $REPO_URL/$SDK /tmp
ADD --chown=code:code $REPO_URL/$NDK /tmp