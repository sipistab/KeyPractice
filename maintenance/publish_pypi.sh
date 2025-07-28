#!/bin/bash
set -e

# Build the package
python -m pip install --upgrade build twine
python -m build

echo "\n--- PyPI Publishing ---"
if [ -z "$PYPI_API_TOKEN" ]; then
  read -sp "Enter your PyPI API token (starts with 'pypi-'): " PYPI_API_TOKEN
  echo
fi

twine upload --non-interactive -u __token__ -p "$PYPI_API_TOKEN" dist/*

echo "\nUpload complete!" 