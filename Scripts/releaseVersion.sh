#!/bin/bash
# Releases a new version of the lib.
# Intended to be run manually from within the project folder.
# The current branch is the master branch and the code has been pushed.
# Arguments: 
# string: The new marketing version, e.g. 1.2

# Assure 1 argument is passed.
if [ $# -ne 1 ]
  then
    echo "Requires marketing version as argument."
    exit 1
fi

# Get the lib's marketing version.
LIB_VERSION=$1 # using agvtool doesn't work anymore: $(agvtool what-marketing-version -terse1)
echo "Releasing v$LIB_VERSION"
# Create a new git tag with the lib's version.
git tag $LIB_VERSION
# Push tags.
git push --tags
# Verify podspec is passing validation.
pod spec lint
# Update pod.
pod trunk push INCommons.podspec
# If updating fails because of an invalid session then run:
# pod trunk register Sven.Korset@indie-software.com 'Sven Korset'
