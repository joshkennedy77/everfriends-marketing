const { execSync } = require('child_process');
const fs = require('fs');
const path = require('path');

console.log('Starting Flutter web build...');

try {
  // Install Flutter if not available
  if (!fs.existsSync('flutter')) {
    console.log('Installing Flutter...');
    execSync('wget -O flutter.tar.xz https://storage.googleapis.com/flutter_infra_release/releases/stable/linux/flutter_linux_3.24.5-stable.tar.xz', { stdio: 'inherit' });
    execSync('tar xf flutter.tar.xz', { stdio: 'inherit' });
  }

  // Set Flutter path
  process.env.PATH = `${process.env.PATH}:${process.cwd()}/flutter/bin`;

  // Enable web support
  execSync('flutter config --enable-web', { stdio: 'inherit' });

  // Get dependencies
  console.log('Getting Flutter dependencies...');
  execSync('flutter pub get', { stdio: 'inherit' });

  // Build for web
  console.log('Building Flutter web app...');
  execSync('flutter build web --release', { stdio: 'inherit' });

  // Copy to docs directory
  console.log('Copying build output to docs/...');
  if (fs.existsSync('docs')) {
    fs.rmSync('docs', { recursive: true });
  }
  fs.mkdirSync('docs', { recursive: true });
  
  // Copy all files from build/web to docs
  execSync('cp -r build/web/* docs/', { stdio: 'inherit' });

  console.log('Build completed successfully!');
} catch (error) {
  console.error('Build failed:', error.message);
  process.exit(1);
}


