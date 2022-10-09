#!/bin/bash
# Releases a new version of the lib.
# Intended to be run manually from within the project folder.
# The current branch is the master branch and the code has been pushed.
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

# Get the lib's marketing version.
# Using agvtool doesn't work anymore: $(agvtool what-marketing-version -terse1)
# Therefore, we need to get it passed as argument.
LIB_VERSION=$1
echo "Releasing v$LIB_VERSION"

# Create a new git tag with the lib's version.
git tag $LIB_VERSION
# Push tags.
git push --tags

if [ "$IS_LIB_PROJECT" = true ]
then
  # Verify lib's podspec is passing validation before pushing it.
  pod spec lint
  if [ "$IS_PUBLIC_REPO" = true ]
  then
    # Push podspec for a public repo.
    pod trunk push "$POD_SPEC_NAME"
    # If updating failed because of an invalid session then run:
    # pod trunk register Sven.Korset@indie-software.com 'Sven Korset'
  else
    # Push podspec for a private repo. 
    pod repo push PrivateSpecs $POD_SPEC_NAME --allow-warnings
    # If the push command failed then run that command before:
    # pod repo add PrivateSpecs https://github.com/indieSoftware/PrivateSpecs.git
  fi
else
  # Nothing to do for app projects.
fi
