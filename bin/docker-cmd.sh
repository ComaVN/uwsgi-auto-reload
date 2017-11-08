#!/bin/sh

PID_FILE="/var/run/uwsgi.pid"

trap 'uwsgi --stop "$PID_FILE"' TERM

uwsgi \
    --py-auto-reload 3 \
    --socket 0.0.0.0:3031 \
    --pidfile "$PID_FILE" \
    --daemonize2 /tmp/uwsgi.log \
    --wsgi app.wsgi:application \
;

sleep 1
while kill -0 $(cat "$PID_FILE") 2> /dev/null; do
    sleep 1
done
