#!/bin/bash
# Prepares the project for a new version of the lib/app.
# Intended to be run manually from within the project folder.
# Arguments: 
# string: The new marketing version, e.g. 1.2

# Assure 1 argument is passed.
if [ $# -ne 1 ]
  then
    echo "Requires marketing version as argument, e.g. 1.2"
    exit 1
fi

# Load configurations.
. config.sh

# Increment the lib's version number.
agvtool next-version
# Sets the lib's marketing version to the value passed as argument.
agvtool new-marketing-version $1

if [ "$IS_LIB_PROJECT" = true ]
then
  # Update podspec of lib project.
  # Replace the 3rd line in the podspec to update the version number.
  sed -i '' "3s/.*/ spec.version = \"$1\" # auto-generated/" INLibTemplate.podspec
  # Replace the 4th line in the podspec to update the swift version read from the file.
  SWIFT_VERSION=$(<.swift-version)
  sed -i '' "4s/.*/ spec.swift_version = \"$SWIFT_VERSION\" # auto-generated/" INLibTemplate.podspec
  # Lint podspec to be sure everything is still valid.
  pod lib lint INLibTemplate.podspec
else
  # Nothing to do for app projects.
fi
