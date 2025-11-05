# label-studio-sample

This repository contains a minimal setup to run Label Studio locally for experimentation.

## What this does

- Creates and uses a Python virtual environment
- Installs project dependencies from `requirements.txt` (which already pins `label-studio`)
- Starts Label Studio with an admin user using the included `scripts/run.sh` script

## Quick setup (zsh)

1. Make the run script executable (only needed once):

```zsh
chmod +x scripts/run.sh
```

2. Run the script. It will create a `.venv` virtual environment, install dependencies, and start Label Studio.

```zsh
scripts/run.sh
```

The script will prompt for an admin password if `ADMIN_PASS` is not set in your environment.

## Environment variables (optional)

`ADMIN_USER` - admin username/email (default: `admin@example.com`)
`ADMIN_PASS` - admin password; if not provided the script will prompt for it

Example using environment variables:

```zsh
ADMIN_USER=admin@example.com scripts/run.sh
```

## Troubleshooting

- If the script fails with "python: command not found", set `PYTHON` to a valid Python 3 path, e.g. `PYTHON=$(which python3)`.
- If installation errors occur while building wheels (e.g., `opencv-python` or `lxml`), ensure you have Xcode command line tools installed on macOS: `xcode-select --install`.
- To re-create the venv from scratch:

```zsh
rm -rf .venv
scripts/run.sh
```

## Notes

- `requirements.txt` in this repo already includes `label-studio==1.21.0`. The run script installs from that file. If you want a different Label Studio version, edit `requirements.txt` or install it manually into the virtualenv.
