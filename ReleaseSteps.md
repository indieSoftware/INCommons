# Steps to release a new version

1. Use the script `Scripts/updateDependencies.sh` to update the gems and pods to the latest version.
2. Apply any code changes.
	- Verify that all changes have been logged to [Changelog.md](Changelog.md).
	- Verify that all tests passes.
3. Update build and marketing version.
	- Because of a bug in agvtool and projects created with Xcode 13 we can't use the following script. We have to update the marketing version of the library manually. 
	 - (Run the `Scripts/updateVersion.sh` script and pass the new marketing version (e.g. `1.2.3`) as argument to prepare a new release version.)
  - However, we can call `Scripts/incrementBuildVersion.sh` to increment the lib's build version.
4. Run the `Scripts/generateDocs.sh` script to update the documentation.
5. Merge branch with master and push to origin.
6. Run the `Scripts/releaseVersion.sh` script to create and push a new git tag for the lib's new version and to update cocoapods.
