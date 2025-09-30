#!/bin/bash

# Install Flutter on Vercel
echo "Installing Flutter..."

# Download and install Flutter
wget -O flutter.tar.xz https://storage.googleapis.com/flutter_infra_release/releases/stable/linux/flutter_linux_3.24.5-stable.tar.xz
tar xf flutter.tar.xz

# Add Flutter to PATH
export PATH="$PATH:`pwd`/flutter/bin"

# Enable Flutter web
flutter config --enable-web

# Get Flutter dependencies
flutter pub get

echo "Flutter installation completed!"


