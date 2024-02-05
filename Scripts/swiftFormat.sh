#!/bin/bash
# Runs swiftformat
# Intended to be run manually from within the project folder.
# Source: https://www.juxhinbakalli.com/posts/swiftFormat/
# Arguments: 
# Any parameter to pass to swiftformat e.g  "--lint" for running it in lint mode.
 
# Include swift format code path variable.
. config.sh

# determine the correct path for swiftformat
SDKROOT=(xcrun --sdk macosx --show-sdk-path)

# runs swiftformat with a first parameter if there is one.
./Scripts/tools/swiftformat ${SWIFT_FORMAT_CODE_PATHS[*]} $1
