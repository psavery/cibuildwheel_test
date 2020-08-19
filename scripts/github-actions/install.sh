#!/usr/bin/env bash
set -ev

python -m pip install cibuildwheel==1.5.5

if [[ $RUNNER_OS == "Windows" ]]; then
  choco install -y swig
elif [[ $RUNNER_OS == "macOS" ]]; then
  brew install swig
elif [[ $RUNNER_OS == "Linux" ]]; then
  sudo apt-get install -y swig
fi
