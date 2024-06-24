#!/bin/bash
# Updated : Fabric 2.x : April 2020

if [ -z $SUDO_USER ]
then
    echo "===== Script needs to be executed with sudo ===="
    echo "Change directory to 'setup'"
    echo "Usage: sudo ./caserver.sh"
    exit 0
fi

echo "======= Set up Go language ======"

# Get the version 1.13 from Google
wget https://dl.google.com/go/go1.13.3.linux-amd64.tar.gz
act='ttyout="*"'
tar -xf go1.13.3.linux-amd64.tar.gz --checkpoint --checkpoint-action=$act -C /usr/local 
rm go1.13.3.linux-amd64.tar.gz

# If GOROOT is not already set, then set it
if [ -z $GOROOT ]
then
    echo "export GOROOT=/usr/local/go" >> ~/.profile
    echo "export PATH=\$HOME/go/bin:/usr/local/go/bin:\$PATH" >> ~/.profile

    GOPATH=$PWD/../gopath
    ABS_PATH=$(readlink -f $GOPATH)
    GOPATH=$ABS_PATH

    echo "export GOPATH=$GOPATH" >> ~/.profile
    echo "======== Updated .profile with GOROOT/GOPATH/PATH ===="

    echo "export GOROOT=/usr/local/go" >> ~/.bashrc
    echo "export GOPATH=$GOPATH" >> ~/.bashrc
    echo "export PATH=\$HOME/go/bin:/usr/local/go/bin:\$PATH" >> ~/.bashrc

    source ~/.profile
    source ~/.bashrc
    echo "======== Updated .bashrc with GOROOT/GOPATH/PATH ===="

    # Updated Dec 15, 2019
    GOCACHE="$HOME/.go-cache"
    echo "export GOCACHE=$HOME/.go-cache" >> ~/.bashrc
    mkdir -p $GOCACHE
    chown -R $USER $GOCACHE

else
    echo "======== No change made to .profile ====="
fi

echo "======= Done. PLEASE LOG OUT & LOG BACK IN ===="
echo "Then validate by executing 'go version'"