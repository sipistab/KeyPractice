@echo off
setlocal

REM Upgrade build and twine
python -m pip install --upgrade build twine
if %errorlevel% neq 0 exit /b %errorlevel%

REM Build the package
python -m build
if %errorlevel% neq 0 exit /b %errorlevel%

REM Prompt for API key if not set
if "%PYPI_API_TOKEN%"=="" (
    set /p PYPI_API_TOKEN=Enter your PyPI API token (starts with 'pypi-'): 
)

if "%PYPI_API_TOKEN%"=="" (
    echo API token is required. Exiting.
    exit /b 1
)

REM Upload all files in dist/
python -m twine upload --non-interactive -u __token__ -p %PYPI_API_TOKEN% dist/*
if %errorlevel% neq 0 exit /b %errorlevel%

echo.
echo Upload complete!
endlocal 