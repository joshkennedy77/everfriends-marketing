#!/bin/bash

echo "🚀 Building EverFriends for Vercel deployment..."

# Build Flutter web app
echo "📱 Building Flutter web app..."
cd everfriends_flutter
flutter build web --release
cp -r build/web/* docs/

# Create Vercel output directory structure
echo "📁 Creating Vercel output structure..."
cd ..
mkdir -p .vercel-output

# Copy marketing site
echo "🌐 Copying marketing site..."
cp -r everfriends_flutter/marketing/* .vercel-output/

# Copy Flutter app to app subdirectory
echo "📱 Copying Flutter app..."
mkdir -p .vercel-output/app
cp -r everfriends_flutter/docs/* .vercel-output/app/

# Copy Vercel config
echo "⚙️ Copying Vercel configuration..."
cp vercel.json .vercel-output/

echo "✅ Build complete! Ready for Vercel deployment."
echo "📁 Output directory: .vercel-output/"
echo "🌐 Marketing site: /"
echo "📱 Flutter app: /app"
