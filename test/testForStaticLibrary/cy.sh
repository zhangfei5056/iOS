
# xcodebuild -testForStaticLibrary targetName clean
# xcodebuild -target testForStaticLibrary -sdk iphoneos  
# xcodebuild -testForStaticLibrary targetName clean
# xcodebuild -target testForStaticLibrary -sdk iphonesimulator
xcodebuild -testForStaticLibrary clean
xcodebuild -target testForStaticLibrary -sdk iphoneos8.1 -arch armv7 -arch armv7s -arch arm64 -configuration Release clean build CONFIGURATION_BUILD_DIR=$PWD/device
xcodebuild -testForStaticLibrary clean
xcodebuild -target testForStaticLibrary  -sdk iphonesimulator8.1 -arch i386 -arch x86_64 -configuration Release clean build CONFIGURATION_BUILD_DIR=$PWD/simulator
phone=$PWD/device/libtestForStaticLibrary.a
Simulator=$PWD/simulator/libtestForStaticLibrary.a
lipo -info $phone
lipo -info $Simulator
mkdir universal
lipo -create $phone $Simulator -output $PWD/universal/universallibtestForStaticLibrary.a
open $PWD

# rm -rf $PWD/build/*

# rm -rf $PWD/build/*




# phone=$PWD/build/Release-iphoneos/libtestForStaticLibrary.a
# Simulator=$PWD/build/Release-iphonesimulator/libtestForStaticLibrary.a
# lipo -info $phone
# lipo -info $Simulator
# mkdir universal
# lipo -create $phone $Simulator -output $PWD/universal/universal.a




