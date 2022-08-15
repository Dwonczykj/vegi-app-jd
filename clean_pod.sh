#!/bin/zsh

cd ./ios

rm -rf Podfile.lock

pod install --repo-update

cd ..