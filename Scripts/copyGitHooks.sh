#!/bin/sh
# Copies the git hook files into the local .git/hooks folder backing up any existing files.
# Intended to be run via Xcode during the build phase from the project path to prevent any unformatted code commits.

# The version number of the hook scripts. Increment if something has been changed in the scripts.
scriptVersion="2"
# Some constants for the script.
pathToGitHooks=".git/hooks" # The relative path from the folder where this script is in to the git hook folder.
pathToSourcHooks="Scripts/hooks" # The relative path to the hooks folder from where to copy the files from.
backupPostfix="_v$scriptVersion" # A postfix added to a backup file

# Make sure the git hooks folder exists.
mkdir -p $pathToGitHooks
# Make a backup of a previous hook script if necessary and copy the new one to the hooks folder.
scriptName="pre-commit"
mv $pathToGitHooks/$scriptName $pathToGitHooks/$scriptName$backupPostfix
cp $pathToSourcHooks/$scriptName $pathToGitHooks/
