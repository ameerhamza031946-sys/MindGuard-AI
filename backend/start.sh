#!/bin/bash
# start.sh
export PYTHONPATH=$PYTHONPATH:.
echo "Running from: $(pwd)"
echo "PYTHONPATH: $PYTHONPATH"

# Increase timeout to 120s to allow MongoDB Atlas handshake
gunicorn -w 4 -k uvicorn.workers.UvicornWorker app.main:app --bind 0.0.0.0:$PORT --timeout 120
