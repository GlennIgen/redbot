#!/bin/bash
#NOT USED - Keeping for now
chown -R $RED_USERNAME:users /app
exec runuser -u $RED_USERNAME "$@"
