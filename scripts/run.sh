#!/usr/bin/env bash
set -euo pipefail

# default configuration (override with environment variables)
VENV_DIR=${VENV_DIR:-.venv}
ADMIN_USER=${ADMIN_USER:-admin@example.com}

# create virtualenv if missing
if [ ! -d "$VENV_DIR" ]; then
    echo "$VENV_DIR does not exist, creating.."
    uv venv "$VENV_DIR" -p python3.12  && source "$VENV_DIR/bin/activate"
    echo "$VENV_DIR activated"
else
    echo "Using existing virtual environment in $VENV_DIR..."
    source "$VENV_DIR/bin/activate"
fi

echo "Syncing dependencies with uv (this may take a few minutes)..."
uv sync

# prompt for admin password if not set
if [ -z "${ADMIN_PASS-}" ]; then
    read -rsp "Enter admin password for $ADMIN_USER: " ADMIN_PASS
    echo
fi

echo "Starting Label Studio"

# run label-studio start with provided options
label-studio start -p 8091 --username "$ADMIN_USER" --password "$ADMIN_PASS"
