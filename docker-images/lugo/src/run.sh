#!/bin/sh
echo "CONFIG_FILE=$CONFIG_FILE"
gunicorn -w 4 -b 0.0.0.0:80 app:app 2>&1

