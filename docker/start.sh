#!/bin/bash
set -e

echo "Starting Jesse Trading Bot environment..."

# Install live plugins if necessary
cd /home
jesse install-live --no-strict || true

# Start Jupyter Notebook in background
echo "Starting Jupyter Notebook on port 8888..."
jupyter notebook \
    --ip=0.0.0.0 \
    --port=8888 \
    --no-browser \
    --allow-root \
    --notebook-dir=/home \
    > /var/log/jupyter.log 2>&1 &

# Wait for Jupyter to start
sleep 3

# Start Jesse Dashboard
echo "Starting Jesse Dashboard on port 9000..."
jesse run
