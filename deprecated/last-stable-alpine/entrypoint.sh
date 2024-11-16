#!/bin/sh
chown -R redbot:redbot /app
exec runuser -u redbot "$@"
