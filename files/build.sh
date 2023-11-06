#!/bin/bash
set -e  # Exit on error

#Install Rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
source "$HOME/.cargo/env"

# Set environment variables
export FD_AUTO_INSTALL_PACKAGES=1

# Run the deps script and make
./deps.sh check install
make -j fdctl solana