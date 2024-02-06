#!/bin/bash
# Loads all swift tools via SPM dependencies and copies them to a tools folder.
# Intended to be run manually from within the project root folder.

# Determine the correct path for swiftformat.
SDKROOT=(xcrun --sdk macosx --show-sdk-path)
TOOLS_PATH=./Scripts/tools
SWIFT_TOOLS_PATH=./Scripts/SwiftTools

# Runs swift to fetch all packages.
swift run --package-path $SWIFT_TOOLS_PATH swiftformat --version
swift run --package-path $SWIFT_TOOLS_PATH swiftlint --version
swift run --package-path $SWIFT_TOOLS_PATH rswift --version

# Create an empty tools folder and copy the binaries into it.
rm -r $TOOLS_PATH
mkdir -p $TOOLS_PATH
cp $SWIFT_TOOLS_PATH/.build/debug/swiftformat $TOOLS_PATH
cp $SWIFT_TOOLS_PATH/.build/debug/swiftlint $TOOLS_PATH
cp $SWIFT_TOOLS_PATH/.build/debug/rswift $TOOLS_PATH

echo "Tools created"
