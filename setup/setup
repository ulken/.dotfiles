#!/usr/bin/env bash

set -e

function install_xcode_cli_tools() {
  local lock_path=/tmp/.com.apple.dt.CommandLineTools.installondemand.in-progress

  product=$(softwareupdate -l |
    grep "\*.*Command Line" |
    head -n 1 | awk -F"*" '{print $2}' |
    sed -e 's/^ *//' |
    tr -d '\n')
  softwareupdate -i "$product" --verbose

  rm $lock_path
}

if xcode-select -p > /dev/null 2>&1; then
  echo "Xcode Command Line Tools required, installing..."
  install_xcode_cli_tools
fi

./brew.sh
./post_install.sh
./user_defaults.sh
