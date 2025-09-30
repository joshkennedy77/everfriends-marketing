#!/bin/bash

# Set Flutter path (should be installed by install.sh)
export PATH="$PATH:`pwd`/flutter/bin"

# Verify Flutter is available
if ! command -v flutter &> /dev/null; then
    echo "Error: Flutter not found. Make sure install.sh ran successfully."
    exit 1
fi

echo "Building Flutter web app..."

# Get dependencies
flutter pub get

# Build for web
flutter build web --release

# Copy build output to docs directory for Vercel
echo "Copying build output to docs/..."
rm -rf docs
mkdir -p docs
cp -r build/web/* docs/

echo "Build completed. Output in docs/"
