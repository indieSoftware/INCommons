#!/bin/sh
# Defines some variables used by other scripts.
# Intended to be run from within Xcode before running SwiftFormat or by any other script.

# Sets the folder paths to the sources which to format automatically via SwiftFormat.
SWIFT_FORMAT_CODE_PATHS=("Sources" "Tests" "INCommonsExample")
SWIFT_FORMAT_EXCLUDE_PATHS=""

# Set to "false" when this project's repository is a private repository and "true" when it's a public project.
IS_PUBLIC_REPO=true
# Set to "true" when this project is a library/framework, otherwise to "false" when this is an app project.
IS_LIB_PROJECT=true
# The name of the podspec file. Only used when this project is a library, not an app (IS_LIB_PROJECT == true).
POD_SPEC_NAME="INCommons.podspec"
