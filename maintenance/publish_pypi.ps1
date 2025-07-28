# Build the package
python -m pip install --upgrade build twine
python -m build

# Prompt for API key
$apiKey = Read-Host -AsSecureString "Enter your PyPI API token (starts with 'pypi-')"
$apiKeyPlain = [Runtime.InteropServices.Marshal]::PtrToStringAuto([Runtime.InteropServices.Marshal]::SecureStringToBSTR($apiKey))

# Upload to PyPI
python -m twine upload --non-interactive -u __token__ -p $apiKeyPlain dist/* 