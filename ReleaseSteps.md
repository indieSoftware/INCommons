# Steps to release a new version

1. Run `./Scripts/updateDependencies.sh` from the project's folder to update the gems and pods to the latest version.
2. Apply any code changes.
	- Verify that all changes have been logged to [Changelog.md](Changelog.md).
	- Verify that all tests passes.
3. Run `./Scripts/updateVersion.sh 1.2.3` from the project's folder with `1.2.3` replaced by the real new marketing version to update build and marketing version. Respect the semantic versioning, i.e. provide `2.0.0` instead of `2.0`.
4. Run `./Scripts/generateDocs.sh` from the project's folder to update the documentation.
5. Merge branch with master and push to origin.
6. Run `./Scripts/releaseVersion.sh` from the project's folder to release the new lib's version.

