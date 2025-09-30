#!/bin/bash

echo "🚀 Starting EverFriends local development servers..."

# Start Flutter app server (port 3000)
echo "📱 Starting Flutter app server on port 3000..."
cd everfriends_flutter
python3 -m http.server 3000 --directory docs &
FLUTTER_PID=$!

# Start marketing site server (port 8080)
echo "🌐 Starting marketing site server on port 8080..."
cd marketing
python3 -m http.server 8080 &
MARKETING_PID=$!

echo ""
echo "✅ Servers started successfully!"
echo "📱 Flutter app: http://localhost:3000"
echo "🌐 Marketing site: http://localhost:8080"
echo "📄 Marketing site (local links): http://localhost:8080/index-local.html"
echo ""
echo "Press Ctrl+C to stop both servers"

# Function to cleanup on exit
cleanup() {
    echo ""
    echo "🛑 Stopping servers..."
    kill $FLUTTER_PID $MARKETING_PID 2>/dev/null
    exit 0
}

# Set trap to cleanup on script exit
trap cleanup SIGINT SIGTERM

# Wait for user to stop
wait
