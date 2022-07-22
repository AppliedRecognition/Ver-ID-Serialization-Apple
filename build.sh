#!/bin/sh
BUILD_DIR=./build
IOS_ARCHIVE=${BUILD_DIR}/ios.xcarchive
SIM_ARCHIVE=${BUILD_DIR}/iossimulator.xcarchive

rm -rf ${BUILD_DIR}
mkdir -p ${BUILD_DIR}
cd proto
protoc --swift_out ../Protobufs *.proto
cd ..
xcodebuild archive -workspace VerIDSerialization.xcworkspace -scheme VerIDSerialization -configuration Release -archivePath ${IOS_ARCHIVE} -sdk iphoneos -arch arm64 BUILD_LIBRARY_FOR_DISTRIBUTION=YES SKIP_INSTALL=NO
xcodebuild archive -workspace VerIDSerialization.xcworkspace -scheme VerIDSerialization -configuration Release -archivePath ${SIM_ARCHIVE} -sdk iphonesimulator -arch arm64 -arch x86_64 BUILD_LIBRARY_FOR_DISTRIBUTION=YES SKIP_INSTALL=NO
xcodebuild -create-xcframework -framework ${IOS_ARCHIVE}/Products/Library/Frameworks/VerIDSerialization.framework -framework ${SIM_ARCHIVE}/Products/Library/Frameworks/VerIDSerialization.framework -output ${BUILD_DIR}/VerIDSerialization.xcframework
rm -rf ${IOS_ARCHIVE}
rm -rf ${SIM_ARCHIVE}
echo "VerIDSerialization.xcframework compiled in ${BUILD_DIR}"
