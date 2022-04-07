#!/bin/bash
# Updates all local project dependencies, i.e. cocoapods.

# Update gems.
bundle update
# Install missing pods.
bundle exec pod install
# Update pods to newer version.
bundle exec pod update
