#!/bin/bash

cd ../LAPush

xcodebuild clean

rm -rf build

xcodebuild -configuration  "Release"  -target "LightPush" -sdk iphoneos -project LAPush.xcodeproj

mkdir -p ../output/lib

cp -rf build/Release-iphoneos/* ../output/lib/ 

cp -rf build/Release-iphoneos/* ../LAPushDemo/LAPushDemo/Lib/

rm -rf build

cd ../buildscript

mkdir -p ../output/ipa

# xcodebuild clean


rm -rf ../LAPush/build

./ipa_build.sh ../LAPush -t "LAPushDemoTest" -o ../output/ipa


rm -rf ../LAPushDemo/build