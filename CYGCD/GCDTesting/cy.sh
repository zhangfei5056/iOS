
mkdir -p ./iphone
mkdir -p ./iphonesimulator
xcodebuild -target CYGCD -sdk iphoneos -arch armv7 -arch armv7s -arch arm64 -configuration Release clean build CONFIGURATION_BUILD_DIR=./iphone/
xcodebuild -target CYGCD  -sdk iphonesimulator -arch i386 -arch x86_64 -configuration Release clean build CONFIGURATION_BUILD_DIR=./iphonesimulator/



DEVICE_BOX=./iphone/libCYGCD.a
SIMULATOR_BOX=./iphonesimulator/libCYGCD.a


lipo -info $DEVICE_BOX
lipo -info $SIMULATOR_BOX
mkdir -p $PWD/output/
cp -rf ./iphone/include/ $PWD/output/
lipo -create $DEVICE_BOX $SIMULATOR_BOX -output $PWD/output/CYGCD/libCYGCD.a

rm -rf ./build
rm -rf ./iphone
rm -rf ./iphonesimulator

