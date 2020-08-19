#!/usr/bin/env bash
set -ev

python -m pip install cibuildwheel==1.5.5

if [[ $RUNNER_OS == "Windows" ]]; then
  # Use a previous version of swig. The newest version (4.0.2)
  # produces errors on windows like the following:
  # ```
  # Run swig -python example.i
  # (1) : Error: Unable to find 'swig.swg'
  # (3) : Error: Unable to find 'python.swg'
  # [error]Process completed with exit code 1.
  # ```
  choco install -y swig --version=4.0.1
elif [[ $RUNNER_OS == "macOS" ]]; then
  brew install swig
elif [[ $RUNNER_OS == "Linux" ]]; then
  sudo apt-get install -y swig
fi
