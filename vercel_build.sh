#!/bin/bash
set -e

# Install dependencies
apt-get update && apt-get install -y curl git unzip xz-utils zip libglu1-mesa

# Download Flutter SDK
curl -O https://storage.googleapis.com/flutter_infra_release/releases/stable/linux/flutter_linux_3.24.3-stable.tar.xz
tar xf flutter_linux_3.24.3-stable.tar.xz
export PATH="$PATH:`pwd`/flutter/bin"

# Enable web
flutter config --enable-web

# Build the web version
flutter pub get
flutter build web --release
