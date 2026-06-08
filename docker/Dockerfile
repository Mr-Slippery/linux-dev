FROM debian:trixie-slim

# Kernel build dependencies
#   - bc, flex, bison: required by Kbuild
#   - libelf-dev: for objtool (gelf.h)
#   - libssl-dev: for kernel module signing
#   - gcc, make, binutils: toolchain
#
# Buildroot dependencies
#   - wget, cpio, rsync: fetching and staging sources
#   - unzip, file: archive handling and file type detection
#   - diffutils, patch: applying patches
#   - python3: various build scripts
#   - perl: needed by some buildroot packages
#   - g++: host tool compilation
#   - gettext: for packages using i18n
#   - libncurses-dev: for menuconfig (both kernel and buildroot)

RUN apt-get update && apt-get install -y --no-install-recommends \
    bc \
    bison \
    binutils \
    build-essential \
    ca-certificates \
    cpio \
    diffutils \
    file \
    flex \
    g++ \
    gcc \
    gettext \
    libc6-dev \
    libelf-dev \
    libncurses-dev \
    libssl-dev \
    make \
    patch \
    perl \
    python3 \
    rsync \
    unzip \
    wget \
    qemu-system-x86 \
    sudo \
    zstd \
    git \
    && rm -rf /var/lib/apt/lists/*

ARG UID=1000
ARG GID=1000
ARG USERNAME=user

RUN groupadd -g $GID $USERNAME \
 && useradd -u $UID -g $GID -m -s /bin/bash -d /home/$USERNAME $USERNAME \
 && usermod -aG sudo $USERNAME

USER $USERNAME
