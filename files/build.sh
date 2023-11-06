#!/bin/bash
set -e  # Exit on error

# Set environment variables
export FD_AUTO_INSTALL_PACKAGES=1

# Run the deps script and make
./deps.sh check install
make -j fdctl solana