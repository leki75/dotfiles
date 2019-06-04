#!/bin/sh

VERSION=1.12.5
OS=linux
ARCH=amd64

# Download go binaries
#curl -Ls https://dl.google.com/go/go${VERSION}.${OS}-${ARCH}.tar.gz | sudo tar -C /usr/local -xzvf -

# Add variables to zshrc
cat <<EOF >>~/.zshrc
export GOPATH=~/go
export PATH=$PATH:/usr/local/go/bin:$GOPATH/bin
EOF
