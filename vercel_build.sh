#!/bin/bash
set -e

# Download Flutter SDK 3.35.7 stable (supports Dart 3.8.1+)
curl -O https://storage.googleapis.com/flutter_infra_release/releases/stable/linux/flutter_linux_3.35.7-stable.tar.xz
tar xf flutter_linux_3.35.7-stable.tar.xz
export PATH="$PATH:`pwd`/flutter/bin"

# Allow git operations in Flutter SDK folder
git config --global --add safe.directory /vercel/path0/flutter

# Enable web support
flutter config --enable-web

# Get dependencies
flutter pub get

# Build web app
flutter build web --release
