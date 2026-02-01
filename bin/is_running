#!/bin/sh

is_running() {
    pgrep -x "$1" >/dev/null
}

if is_running $1; then
    echo "running"
else
    echo "Not running"
fi

