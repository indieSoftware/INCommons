#!/bin/bash
# Updates the scripts and tool configurations with the latest changes from the Resources repository.
# Intended to be run manually from within the project folder (not the Scripts folder).

TMP_FOLDER_PATH="~updateScripts"

# Clean up any possible left overs.
rm -rf $TMP_FOLDER_PATH

# Clone the Resources repo into a temporary folder.
# Use following command line during development of this script (update the branch's reference accordingly)
#git clone --branch scripts-feature https://github.com/indieSoftware/Resources.git $TMP_FOLDER_PATH
git clone https://github.com/indieSoftware/Resources.git $TMP_FOLDER_PATH

# Delete the old scripts folder and move the new files from the temp folder to the project.
rm -rf ./Scripts
mv -f $TMP_FOLDER_PATH/Configurations/Defaults/{.[!.],}* .

# Create swiftlint.yml file
cat swiftlint-base.yml swiftlint-addition.yml > .swiftlint.yml

# Clean ups.
rm -rf $TMP_FOLDER_PATH

# Create tools.
./Scripts/createTools.sh

echo "Update done"
