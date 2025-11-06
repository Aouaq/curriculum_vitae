#!/bin/bash
set -e

# Download latest Flutter stable (adjust version!)
curl -O https://storage.googleapis.com/flutter_infra_release/releases/stable/linux/flutter_linux_3.13.6-stable.tar.xz
tar xf flutter_linux_3.13.6-stable.tar.xz
export PATH="$PATH:`pwd`/flutter/bin"

# Fix git dubious ownership issue
git config --global --add safe.directory /vercel/path0/flutter

# Enable Flutter web
flutter config --enable-web

# Get dependencies and build
flutter pub get
flutter build web --release
