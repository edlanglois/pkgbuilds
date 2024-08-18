#!/usr/bin/env bash
set -eu
VERSION="$1"
PKGBUILD=mujoco-bin/PKGBUILD

sed -i'' -Ee "s/^(pkgver)=.*/\1=$VERSION/" "$PKGBUILD"

. mujoco-bin/PKGBUILD

sha256sums_x86_64_="$(curl -Ls "${source_x86_64[0]}.sha256" | cut -d' ' -f1)"
sha256sums_aarch64_="$(curl -Ls "${source_aarch64[0]}.sha256" | cut -d' ' -f1)"

sed -i'' -Ee "s/^(sha256sums_x86_64)=.*/\1=('$sha256sums_x86_64_')/" "$PKGBUILD"
sed -i'' -Ee "s/^(sha256sums_aarch64)=.*/\1=('$sha256sums_aarch64_')/" "$PKGBUILD"
