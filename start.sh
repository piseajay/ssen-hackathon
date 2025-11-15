#!/bin/bash

# SSEN Network Monitor - Start Script
# This script starts both backend and frontend services

echo "🚀 Starting SSEN Network Voltage Stability Monitor..."
echo ""

# Check if backend dependencies are installed
if [ ! -d "backend/venv" ]; then
    echo "⚠️  Backend virtual environment not found. Creating..."
    cd backend
    python3 -m venv venv
    venv/bin/pip install -r requirements.txt
    cd ..
fi

# Check if frontend dependencies are installed
if [ ! -d "SSEN-React-Starter-Kit/node_modules" ]; then
    echo "⚠️  Frontend dependencies not found. Installing..."
    cd SSEN-React-Starter-Kit
    pnpm install
    cd ..
fi

echo ""
echo "✅ Dependencies ready!"
echo ""
echo "📝 IMPORTANT: Make sure you've added your NERDA token to backend/app.py"
echo "   Get your token from: https://nerda.ssen.co.uk/nerda"
echo ""
echo "Starting services..."
echo ""

# Start backend in background
echo "🐍 Starting Python backend on port 5000..."
cd backend
../backend/venv/bin/python app.py &
BACKEND_PID=$!
cd ..

# Wait for backend to start
sleep 3

# Start frontend
echo "⚛️  Starting React frontend on port 5173..."
cd SSEN-React-Starter-Kit
pnpm dev &
FRONTEND_PID=$!
cd ..

echo ""
echo "✅ Services started!"
echo ""
echo "🌐 Open your browser to: http://localhost:5173"
echo ""
echo "📊 Backend API: http://localhost:5000"
echo "🎨 Frontend UI: http://localhost:5173"
echo ""
echo "Press Ctrl+C to stop all services..."
echo ""

# Wait for Ctrl+C
trap "echo ''; echo '🛑 Stopping services...'; kill $BACKEND_PID $FRONTEND_PID 2>/dev/null; exit" INT

# Keep script running
wait
